#!/bin/bash

SPACK_ENV=$1
SPACK_SPEC=$2

spack -e "${SPACK_ENV}" concretize -f
spack -e "${SPACK_ENV}" install --until=cmake --test=root --keep-stage

SPACK_SOURCE_DIR=$(spack -e "${SPACK_ENV}" location --source-dir "${SPACK_SPEC}")
SPACK_BUILD_DIR=$(spack -e "${SPACK_ENV}" location --build-dir "${SPACK_SPEC}")

SPACK_ENV_NAME=$(basename "${SPACK_ENV}")
ENVRC_TMP="/tmp/.envrc-${SPACK_ENV_NAME}-${SPACK_SPEC}"
spack -e "${SPACK_ENV}" build-env --dump "${ENVRC_TMP}" "${SPACK_SPEC}"
echo "SPACK_BUILD_DIR=\"${SPACK_BUILD_DIR}\"; export SPACK_BUILD_DIR" >> "${ENVRC_TMP}"
echo "SPACK_SOURCE_DIR=\"${SPACK_SOURCE_DIR}\"; export SPACK_SOURCE_DIR" >> "${ENVRC_TMP}"

cp "${ENVRC_TMP}" "${SPACK_BUILD_DIR}/.envrc"
direnv allow "${SPACK_BUILD_DIR}"

# Add .envrc in SPACK_SOURCE_DIR so that nvim integrated terminal is correctly set up
mv "${ENVRC_TMP}" "${SPACK_SOURCE_DIR}/.envrc"
direnv allow "${SPACK_SOURCE_DIR}"

pushd "${SPACK_SOURCE_DIR}" || exit
