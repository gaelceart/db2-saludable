INSERT INTO paciente VALUES(50403020, 'Alberto', 'Hernández', 'alpepe@gob.ar', '0800302117');

INSERT INTO servicio VALUES('Cardiología', 'Estudios del corazón');

INSERT INTO medico VALUES('12345/AR-MED', 35123456, 'Martín', 'Pérez', 'Cardiología');

INSERT INTO disponibilidad VALUES('lun', '12345/AR-MED', '08:00', '14:00');
INSERT INTO disponibilidad VALUES('mie', '12345/AR-MED', '13:30', '16:30');
INSERT INTO disponibilidad VALUES('sab', '12345/AR-MED', '12:15', '14:00');

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES(50403020,'Cardiología', 3000, '2023-09-16 10:00', 'sab');
--El primer valor es el id serial, a revisar

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES(50403020,'Cardiología', 5000, '2023-09-17 10:00', 'dom');
--RAISE mensaje de error porque es domingo y no es DIA_HABIL

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES(50403020,'Cardiología', 5000, '2023-09-16 10:00', 'lun');
--RAISE mensaje de error porque no coincide el día 
