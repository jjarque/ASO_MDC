#!/bin/bash

source "../base_test.sh"
SCRIPT="../../02_flow_control/04_menu_loop.sh"

test_case "opcion 1 - mostrar fecha actual" \
  "echo -e \"1\n4\n\" | $SCRIPT" \
  "*$(date)*" \
  0

test_case "opcion 2 - mostrar usuario actual" \
  "echo -e \"2\n4\n\" | $SCRIPT" \
  "*$(whoami)*" \
  0

test_case "opcion 3 - mostrar directorio de trabajo" \
  "echo -e \"3\n4\n\" | $SCRIPT" \
  "*$(pwd)*" \
  0

test_case "opcion 4 - salir del menu" \
  "echo -e \"4\n\" | $SCRIPT" \
  "*Que tenga un buen dia*" \
  0

test_case "opcion invalida" \
  "echo -e \"5\n4\n\" | $SCRIPT" \
  "*Opcion no valida*" \
  0

summary || exit 1