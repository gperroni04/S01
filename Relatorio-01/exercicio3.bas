DIM horas AS DOUBLE
DIM minutos AS DOUBLE
DIM segundos AS DOUBLE

PRINT "Digite a quantidade de horas:"
INPUT horas

minutos = horas * 60
segundos = horas * 3600

PRINT "Valor original em horas: "; horas
PRINT "Valor equivalente em minutos: "; minutos
PRINT "Valor equivalente em segundos: "; segundos
