-- AGREGAR RESTRICCIONES AL MOMENTO DE ELEGIR LA FECHA LUEGO DE LA CONVERSIÓN
-- REVISAR EL TIPO DE DATO SERIAL

CREATE TABLE obra_social(
  os_id   SERIAL PRIMARY KEY,
  nombre  TEXT UNIQUE NOT NULL
);

CREATE TABLE paciente(
  dni         INT PRIMARY KEY,
  nombre      TEXT NOT NULL,
  apellido    TEXT NOT NULL,
  email       TEXT NOT NULL,
  telefono    VARCHAR(10) NOT NULL,
  obra_social TEXT NULL,
  CONSTRAINT fk_obra_social FOREIGN KEY (obra_social) REFERENCES obra_social(nombre)
);

CREATE TABLE servicio(
  nombre      TEXT PRIMARY KEY,
  descripcion TEXT NOT NULL
);

CREATE TABLE medico(
  matricula INT PRIMARY KEY,
  dni       INT UNIQUE NOT NULL,
  nombre    TEXT NOT NULL,
  apellido  TEXT NOT NULL,
  servicio  TEXT NOT NULL,
  CONSTRAINT fk_servicio_medico FOREIGN KEY (servicio) REFERENCES servicio(nombre)
);

CREATE TYPE DIA_HABIL AS ENUM ('lun', 'mar', 'mie', 'jue', 'vie', 'sab');

CREATE TABLE turno(
  t_id        SERIAL PRIMARY KEY,
  paciente    INT,
  servicio    TEXT NOT NULL,
  monto       DECIMAL(12, 2) NOT NULL,
  fecha       TIMESTAMP NOT NULL,
  confirmado  BOOLEAN NULL DEFAULT (FALSE),
  estado      TEXT NULL CHECK (estado IN ('en espera', 'atendido', 'cancelado', 'no atendido')) DEFAULT ('en espera'),
  dia         DIA_HABIL NULL, 
  CONSTRAINT fk_servicio_turno FOREIGN KEY (servicio) REFERENCES servicio(nombre),
  CONSTRAINT fk_paciente FOREIGN KEY (paciente) REFERENCES paciente(dni)
);

CREATE OR REPLACE FUNCTION calcular_dia_semana()
RETURNS TRIGGER AS $$
BEGIN
  NEW.dia := CASE EXTRACT(DOW FROM NEW.fecha)
                WHEN 1 THEN 'lun'
                WHEN 2 THEN 'mar'
                WHEN 3 THEN 'mie'
                WHEN 4 THEN 'jue'
                WHEN 5 THEN 'vie'
                WHEN 6 THEN 'sab'
              END;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_dia_semana_trigger
BEFORE INSERT ON turno
FOR EACH ROW
EXECUTE FUNCTION calcular_dia_semana();

CREATE TABLE equipo(
  nombre    TEXT PRIMARY KEY,
  cantidad  INT NOT NULL CHECK (cantidad >= 0)
);

CREATE TABLE disponibilidad(
  dia           DIA_HABIL, 
  medico        INT NOT NULL,
  hora_entrada  TIME CHECK ((dia != 'sab' AND hora_entrada >= '08:00' AND hora_entrada < '20:00') OR (dia = 'sab' AND hora_entrada >= '08:00' AND hora_entrada < '14:00')),
  hora_salida   TIME CHECK ((dia != 'sab' AND hora_salida > '08:00' AND hora_salida<= '20:00') OR (dia = 'sab' AND hora_salida > '08:00' AND hora_salida<= '14:00')),
  PRIMARY KEY (dia, medico, hora_entrada, hora_salida),
  CONSTRAINT fk_medico_disp FOREIGN KEY (medico) REFERENCES medico(matricula)
);
