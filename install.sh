#!/bin/bash

ROOT_UID=0

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
else
  AURORAE_DIR="$HOME/.local/share/aurorae/themes"
  SCHEMES_DIR="$HOME/.local/share/color-schemes"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
fi

SRC_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=JART

[[ ! -d ${AURORAE_DIR} ]] && mkdir -p ${AURORAE_DIR}
[[ ! -d ${SCHEMES_DIR} ]] && mkdir -p ${SCHEMES_DIR}
[[ ! -d ${LOOKFEEL_DIR} ]] && mkdir -p ${LOOKFEEL_DIR}

install() {
  local name=${1}

  [[ -d ${AURORAE_DIR}/${name} ]] && rm -rf ${AURORAE_DIR}/${name}*
  [[ -f ${SCHEMES_DIR}/${name}.colors ]] && rm -rfv ${SCHEMES_DIR}/${name}*.colors
  [[ -d ${LOOKFEEL_DIR}/com.github.k4ustu3h.${name} ]] && rm -rf ${LOOKFEEL_DIR}/com.github.k4ustu3h.${name}*

  cp -r ${SRC_DIR}/aurorae/themes/* ${AURORAE_DIR}
  cp -r ${SRC_DIR}/color-schemes/*.colors ${SCHEMES_DIR}
  cp -r ${SRC_DIR}/plasma/look-and-feel/* ${LOOKFEEL_DIR}
}

echo "Installing Just Another Red Theme..."

install "${name:-${THEME_NAME}}"

echo "Install finished..."
