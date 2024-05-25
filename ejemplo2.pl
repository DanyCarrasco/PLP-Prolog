llueve_en(alemania).
buena_cosecha(X) :- llueve_en(X).
sube_turismo(X) :- not llueve_en(X).
va_bien(X) :- buena_cosecha(X).
va_bien(X) :- sube_turismo(X).
