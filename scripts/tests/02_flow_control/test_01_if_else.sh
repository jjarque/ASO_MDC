#!/bin/bash

source "../base_test.sh"
SCRIPT="../../02_flow_control/01_if_else.sh"

test_case "numero mayor que 10" \
  "echo -e \"15\n\" | $SCRIPT" \
  "15 es mayor que 10" \
  0

test_case "numero menor que 10" \
  "echo -e \"5\n\" | $SCRIPT" \
  "5 es menor que 10" \
  0

test_case "numero igual a 10" \
  "echo -e \"10\n\" | $SCRIPT" \
  "10 es igual que 10" \
  0

summary || exit 1
