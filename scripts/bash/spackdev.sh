#!/bin/bash

# The script needs to be sourced to work correctly
# Use return instead of exit to return to the shell

help() {
	echo "Usage: source spackdev.sh <spack-env> <spack-spec>"
	echo "  spack-env: Spack environment (path)"
	echo "  spack-spec: Spack spec"
}

error_dev(){
	echo "ERROR┌ ${1} is not a 'develop' spec."
	echo "ERROR└  Make sure you are using the correct Spack environment and spec."
	return 1
}

# Warn if build_stage is not set in the Spack environment
warn_bs() {
	echo "WARN┌ You are using a standard 'build_stage' directory."
	echo "WARN| Consider adding the following to your Spack environment:"
	echo "WARN|"
	echo "WARN|     config:"
	echo "WARN└	  build_stage: <path-to-git-repo>/spack-build-stage/"
}

if [[ $# -ne 2 ]]; then
	help
	return
fi

SPACK_ENV=$1
SPACK_SPEC=$2

if command -v ccache 2>&1 > /dev/null; then
   export CMAKE_CXX_COMPILER_LAUNCHER=ccache
   export CMAKE_C_COMPILER_LAUNCHER=ccache
   export CMAKE_Fortran_COMPILER_LAUNCHER=ccache
   export CMAKE_CUDA_COMPILER_LAUNCHER=ccache
   export CMAKE_HIP_COMPILER_LAUNCHER=ccache
fi

# WARN: This only work if $SPACK_SPEC is just after the 'develop' key
grep -A 2 "develop:" "${SPACK_ENV}/spack.yaml" | grep -q "${SPACK_SPEC}:" || error_dev "${SPACK_SPEC}" || return
grep -q "build_stage:" "${SPACK_ENV}/spack.yaml" || warn_bs

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

# Remove dangling symlinks (from previous builds)
find ${SPACK_SOURCE_DIR} -xtype l -delete
	
pushd "${SPACK_SOURCE_DIR}" || return
