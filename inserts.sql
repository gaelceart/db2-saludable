INSERT INTO obra_social (nombre) VALUES ('OSDE');
INSERT INTO obra_social (nombre) VALUES ('Swiss Medical');
INSERT INTO obra_social (nombre) VALUES ('Medicus');
INSERT INTO obra_social (nombre) VALUES ('Galeno');

INSERT INTO paciente VALUES (50403020, 'Alberto', 'Hernández', 'alpepe@gob.ar', '0800302117', 'OSDE');
INSERT INTO paciente VALUES (12345678, 'Juan', 'Pérez', 'juan@email.com', '5551234567', 'OSDE');
INSERT INTO paciente VALUES (98765432, 'Ana', 'Gómez', 'ana@email.com', '5559876543', 'Swiss Medical');
INSERT INTO paciente VALUES (45678912, 'Carlos', 'Rodríguez', 'carlos@email.com', '5554567890', 'Medicus');
INSERT INTO paciente VALUES (65432198, 'Luisa', 'Martínez', 'luisa@email.com', '5556543210', 'Galeno');
INSERT INTO paciente VALUES (78912345, 'María', 'López', 'maria@email.com', '5557891234', 'OSDE');
INSERT INTO paciente VALUES (32165498, 'Pedro', 'García', 'pedro@email.com', '5553216547', 'Swiss Medical');
INSERT INTO paciente VALUES (23456789, 'Laura', 'Hernández', 'laura@email.com', '5552345678', 'Medicus');
INSERT INTO paciente VALUES (56789123, 'José', 'Díaz', 'jose@email.com', '5555678912', 'Galeno');
INSERT INTO paciente VALUES (87654321, 'Sofía', 'Torres', 'sofia@email.com', '5558765432');
INSERT INTO paciente VALUES (98765430, 'Diego', 'Ramos', 'diego@email.com', '5559876541');

INSERT INTO servicio VALUES ('Cardiología', 'Evaluación y tratamiento de enfermedades del corazón.');
INSERT INTO servicio VALUES ('Dermatología', 'Diagnóstico y tratamiento de afecciones de la piel.');
INSERT INTO servicio VALUES ('Ginecología', 'Atención médica para la salud de la mujer.');
INSERT INTO servicio VALUES ('Ortopedia', 'Tratamiento de lesiones y trastornos del sistema musculoesquelético.');
INSERT INTO servicio VALUES ('Oftalmología', 'Evaluación y tratamiento de problemas oculares.');

INSERT INTO medico VALUES ('MN123456', 25890976, 'Dr. Alberto', 'González', 'Cardiología');
INSERT INTO medico VALUES ('MN234567', 19248987, 'Dra. Marta', 'López', 'Dermatología');
INSERT INTO medico VALUES ('MN345678', 28909921, 'Dr. Guillermo', 'Sánchez', 'Ginecología');
INSERT INTO medico VALUES ('MN456789', 35890004, 'Dra. Gabriela', 'Fernández', 'Ortopedia');
INSERT INTO medico VALUES ('MN567890', 38912456, 'Dr. Eduardo', 'Ríos', 'Oftalmología');

INSERT INTO disponibilidad VALUES ('lun', 'MN123456', '08:00', '12:00');
INSERT INTO disponibilidad VALUES ('mar', 'MN234567', '09:00', '17:00');
INSERT INTO disponibilidad VALUES ('mie', 'MN345678', '08:00', '20:00');
INSERT INTO disponibilidad VALUES ('jue', 'MN456789', '08:00', '16:00');
INSERT INTO disponibilidad VALUES ('vie', 'MN567890', '10:00', '18:00');
INSERT INTO disponibilidad VALUES ('sab', 'MN123456', '08:00', '14:00');

INSERT INTO equipo VALUES ('Camilla de examen', 5);
INSERT INTO equipo VALUES ('Desfibrilador', 3);
INSERT INTO equipo VALUES ('Monitor de signos vitales', 4);
INSERT INTO equipo VALUES ('Esterilizador de instrumentos', 1);
INSERT INTO equipo VALUES ('Máquina de rayos X', 2);
INSERT INTO equipo VALUES ('Incubadora neonatal', 3);
INSERT INTO equipo VALUES ('Oftalmoscopio', 3);

INSERT INTO servicio_equipo VALUES ('Cardiología', 'Desfibrilador');
INSERT INTO servicio_equipo VALUES ('Dermatología', 'Camilla de examen');
INSERT INTO servicio_equipo VALUES ('Ginecología', 'Camilla de examen');
INSERT INTO servicio_equipo VALUES ('Ortopedia', 'Máquina de rayos X');
INSERT INTO servicio_equipo VALUES ('Oftalmología', 'Oftalmoscopio');

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (12345678, 'Cardiología', 150.00, '2023-09-18 10:00', 'lun');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (98765430, 'Dermatología', 120.50, '2023-09-19 14:30', 'mar');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (98765432, 'Ginecología', 180.75, '2023-09-20 09:15', 'mie');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (65432198, 'Ortopedia', 200.00, '2023-09-21 11:30', 'jue');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (78912345, 'Oftalmología', 140.25, '2023-09-22 13:45', 'vie');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (12345678, 'Cardiología', 150.00, '2023-09-23 09:30', 'sab');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (98765432, 'Dermatología', 120.50, '2023-09-26 15:15', 'mar');
INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (45678912, 'Ginecología', 180.75, '2023-09-27 10:45', 'mie');

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (50403020,'Cardiología', 3000, '2023-09-16 10:00', 'sab');

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (50403020,'Cardiología', 5000, '2023-09-17 10:00', 'dom');
--RAISE mensaje de error porque es domingo y no es DIA_HABIL

INSERT INTO turno (paciente, servicio, monto, fecha, dia) VALUES (50403020,'Cardiología', 5000, '2023-09-16 10:00', 'lun');
--RAISE mensaje de error porque no coincide el día 


