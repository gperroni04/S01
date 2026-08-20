DIM peso AS DOUBLE
DIM agua AS DOUBLE
DIM meta AS DOUBLE

PRINT "Digite seu peso em kg:"
INPUT peso

PRINT "Digite a quantidade de agua ingerida em ml:"
INPUT agua

meta = peso * 35

IF agua >= meta THEN
    PRINT "Meta atingida!"
ELSE
    PRINT "Meta nao atingida"
END IF
