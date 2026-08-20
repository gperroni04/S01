DIM pinCorreto AS INTEGER
DIM pin AS INTEGER

pinCorreto = 4321

PRINT "Digite o PIN de acesso:"
INPUT pin

WHILE pin <> pinCorreto
    PRINT "PIN invalido. Tente novamente."
    PRINT "Digite o PIN de acesso:"
    INPUT pin
WEND

PRINT "Transacao autorizada!"
