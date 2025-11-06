#!/bin/bash

TESTSCORRECTOS=0
TESTSFALLIDOS=0

# Test 1: Demasiados argumentos
SALIDA=$(../05_args_check.sh 33 8 7)
EXITCODE=$?  # Guardar codigo de salida del comando

if [[ $EXITCODE -eq 1 ]] && [[ $SALIDA == "Uso: ./05_args_check.sh <num1> <num2>" ]]; then
    echo "Test OK"
    ((TESTSCORRECTOS++))
else
    echo "Test FAILED"
    ((TESTSFALLIDOS++))
fi

# Test 2: Argumento no numerico
SALIDA=$(../05_args_check.sh 8 j)
EXITCODE=$?  # Guardar codigo de salida del comando

if [[ $EXITCODE -eq 2 ]] && [[ $SALIDA == "Ambos argumentos deben ser números." ]]; then
    echo "Test OK"
    ((TESTSCORRECTOS++))
else
    echo "Test FAILED"
    ((TESTSFALLIDOS++))
fi

# Test 3: Suma correcta
SALIDA=$(../05_args_check.sh 7 8)
EXITCODE=$?  # Guardar codigo de salida del comando

if [[ $EXITCODE -eq 0 ]] && [[ $SALIDA == "Resultado: 15" ]]; then
    echo "Test OK"
    ((TESTSCORRECTOS++))
else
    echo "Test FAILED"
    ((TESTSFALLIDOS++))
fi

echo "Total de tests OK: $TESTSCORRECTOS"
echo "Total de tests FALLIDOS: $TESTSFALLIDOS"
