#!/bin/bash

# The script needs to be sourced to work correctly
# Use return instead of exit to return to the shell

help() {
	echo "Usage: source spackdev.sh <spack-env> <spack-spec>"
	echo "  spack-env: Spack environment (path)"
	echo "  spack-spec: Spack spec"
}

if [[ $# -ne 2 ]]; then
	help
	return
fi

SPACK_ENV=$1
SPACK_SPEC=$2

spack -e "${SPACK_ENV}" clean || return
spack -e "${SPACK_ENV}" concretize -f || return
spack -e "${SPACK_ENV}" install --until=cmake --test=root --keep-stage || return

SPACK_SOURCE_DIR=$(spack -e "${SPACK_ENV}" location --source-dir "${SPACK_SPEC}")
SPACK_BUILD_DIR=$(spack -e "${SPACK_ENV}" location --build-dir "${SPACK_SPEC}")

SPACK_ENV_NAME=$(basename "${SPACK_ENV}")
ENVRC_TMP="/tmp/.envrc-${SPACK_ENV_NAME}-${SPACK_SPEC}"
spack -e "${SPACK_ENV}" build-env --dump "${ENVRC_TMP}" "${SPACK_SPEC}" || return
echo "SPACK_BUILD_DIR=\"${SPACK_BUILD_DIR}\"; export SPACK_BUILD_DIR" >> "${ENVRC_TMP}"
echo "SPACK_SOURCE_DIR=\"${SPACK_SOURCE_DIR}\"; export SPACK_SOURCE_DIR" >> "${ENVRC_TMP}"

cp "${ENVRC_TMP}" "${SPACK_BUILD_DIR}/.envrc"
direnv allow "${SPACK_BUILD_DIR}"

# Add .envrc in SPACK_SOURCE_DIR so that nvim integrated terminal is correctly set up
mv "${ENVRC_TMP}" "${SPACK_SOURCE_DIR}/.envrc"
direnv allow "${SPACK_SOURCE_DIR}"

# Be friendly to LSPs
mkdir -p "${SPACK_SOURCE_DIR}/build"
ln -sf "${SPACK_BUILD_DIR}/compile_commands.json" "${SPACK_SOURCE_DIR}/build/compile_commands.json"
	
pushd "${SPACK_BUILD_DIR}" || return
