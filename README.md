# db2-saludable
Bases de Datos II - Saludable

Scripts para postgreSQL
```
\i init.sql
```
Para correr los scripts de creación de base de datos, tablas e inserciones de datos.

Al terminar el script, arroja dos mensajes de error:
#### Ocasionado por una inserción en la tabla `turno` con el día `'dom'`. Según la consigna, los días domingo se encuentra cerrado el establecimiento.
```
psql:inserts.sql:62: ERROR:  invalid input value for enum dia_habil: "dom"
```


#### Al momento de insertar un turno, el día de la semana del `timestamp` debe coincidir con el día ingresado en la _query_.
```
psql:inserts.sql:65: ERROR:  El día no coincide con la fecha
```
---
### Lockeo
Simulación de lockeo de la base de datos:

https://github.com/gaelceart/db2-saludable/assets/59783452/4ca41a53-a2be-4f83-9409-5f9dad3ff910

Los dos usuarios realizaron la misma consulta a la tabla `paciente`.
El primer usuario 'Terminal A' realiza un *LOCK* a la tabla `paciente`, luego el segundo usuario 'Terminal B' realiza la misma consulta de antes solo que ahora se queda en espera ya que la tabla se encuentra lockeada.
Terminal A modifica un dato con la _query_ *UPDATE* y termina el lockeo con la sentencia *COMMIT* lo que causa que, Terminal B muestre el resultado de la consulta con el dato modificado.
