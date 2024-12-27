#!/bin/bash

# This script sets the environment properly so that a user can access CSCS
# login nodes via ssh. 

#    Copyright (C) 2023, ETH Zuerich, Switzerland
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#    AUTHORS Massimo Benini, Rocco Meli

#Params
MFA_KEYS_URL="https://sshservice.cscs.ch/api/v1/auth/ssh-keys/signed-key"

#Detect OS
OS="$(uname)"
case "${OS}" in
  'Linux')
    OS='Linux'
    ;;
  'FreeBSD')
    OS='FreeBSD'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
  'Darwin')
    OS='Mac'
    ;;
  *) ;;
esac

OP_ITEM="CSCS"
USERNAME=$(op item get "$OP_ITEM" --fields label=username)
PASSWORD=$(op item get "$OP_ITEM" --fields label=password)
OTP=$(op item get "$OP_ITEM" --otp)

#Validate inputs
if ! [[ "${USERNAME}" =~ ^[[:lower:]_][[:lower:][:digit:]_-]{2,15}$ ]]; then
    echo "Username is not valid."
    exit 1
fi

if [ -z "${PASSWORD}" ]; then
    echo "Password is empty."
    exit 1
fi

if ! [[ "${OTP}" =~ ^[[:digit:]]{6} ]]; then
    echo "OTP is not valid, OTP must contains only six digits."
    exit 1
fi

echo "  Authenticating to the SSH key service..."

HEADERS=(-H "Content-Type: application/json" -H "accept: application/json")
KEYS=$(curl -s -S --ssl-reqd \
    "${HEADERS[@]}" \
    -d "{\"username\": \"$USERNAME\", \"password\": \"$PASSWORD\", \"otp\": \"$OTP\"}" \
    "$MFA_KEYS_URL")

echo "${KEYS}"

if [ $? != 0 ]; then
    exit 1
fi

echo "  Retrieving the SSH keys..."

echo ${DICT_KEY}
if [ "${DICT_KEY}" == "payload" ]; then
   MESSAGE=$(echo "${KEYS}" | cut -d \" -f 6)
   ! [ -z "${MESSAGE}" ] && echo "${MESSAGE}"
   echo "Error fetching the SSH keys. Aborting."
   exit 1
fi

PUBLIC=$(echo "${KEYS}" | cut -d \" -f 4)
PRIVATE=$(echo "${KEYS}" | cut -d \" -f 8)

#Check if keys are empty:
if [ -z "${PUBLIC}" ] || [ -z "${PRIVATE}" ]; then
    echo "Error fetching the SSH keys. Aborting."
    exit 1
fi

echo "  Setting up the SSH keys into your home folder..."

# Check ~/.ssh folder and store the keys
echo "${PUBLIC}" | awk '{gsub(/\\n/,"\n")}1' > ~/.ssh/cscs-key-cert.pub || exit 1
echo "${PRIVATE}" | awk '{gsub(/\\n/,"\n")}1' > ~/.ssh/cscs-key || exit 1

# Setting permissions:
chmod 644 ~/.ssh/cscs-key-cert.pub || exit 1
chmod 600 ~/.ssh/cscs-key || exit 1

# Format the keys:
if [ "${OS}" = "Mac" ]
then
  sed -i '' -e '$ d' ~/.ssh/cscs-key-cert.pub || exit 1
  sed -i '' -e '$ d' ~/.ssh/cscs-key || exit 1
else [ "${OS}" = "Linux" ]
  sed '$d' ~/.ssh/cscs-key-cert.pub || exit 1
  sed '$d' ~/.ssh/cscs-key || exit 1
fi

eval "$(ssh-agent -s)"

ssh-add -t 1d ~/.ssh/cscs-key
