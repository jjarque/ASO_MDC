#!/bin/bash

source "../base_test.sh"
SCRIPT="../../02_flow_control/03_case_menu.sh"

test_case "opcion 1 - mostrar fecha actual" \
  "echo -e \"1\n\" | $SCRIPT" \
  "*$(date)*" \
  0

test_case "opcion 2 - mostrar usuario actual" \
  "echo -e \"2\n\" | $SCRIPT" \
  "*$(whoami)*" \
  0

test_case "opcion 3 - salir" \
  "echo -e \"3\n\" | $SCRIPT" \
  "*Que tenga un buen dia*" \
  0

test_case "opcion invalida" \
  "echo -e \"4\n\" | $SCRIPT" \
  "*Opcion no valida*" \
  0

summary || exit 1

