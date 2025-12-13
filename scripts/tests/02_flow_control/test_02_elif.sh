#!/bin/bash

source "../base_test.sh"
SCRIPT="../../02_flow_control/02_elif.sh"

test_case "nota menor o igual a 4" \
  "echo -e \"3\n\" | $SCRIPT" \
  "Suspenso" \
  0

test_case "nota igual a 5" \
  "echo -e \"5\n\" | $SCRIPT" \
  "Aprobado" \
  0

test_case "nota igual a 6" \
  "echo -e \"6\n\" | $SCRIPT" \
  "Bien" \
  0

test_case "nota igual a 7" \
  "echo -e \"7\n\" | $SCRIPT" \
  "Notable" \
  0

test_case "nota igual a 8" \
  "echo -e \"8\n\" | $SCRIPT" \
  "Notable" \
  0

test_case "nota igual a 9" \
  "echo -e \"9\n\" | $SCRIPT" \
  "Sobresaliente" \
  0

test_case "nota igual a 10" \
  "echo -e \"10\n\" | $SCRIPT" \
  "Sobresaliente" \
  0

summary || exit 1