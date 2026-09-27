SET search_path TO schema_brechas;

-- 1. Eliminar tablas si quedaron creadas a medias
DROP TABLE IF EXISTS exposicion_usuario CASCADE;
DROP TABLE IF EXISTS brecha_seguridad CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS tipo_dato CASCADE;
DROP TABLE IF EXISTS organizacion CASCADE;

-- 2. Creación de Tablas Normalizadas
CREATE TABLE organizacion (
    id_organizacion SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE,
    sector_economico VARCHAR(100),
    pais VARCHAR(100),
    tamano_empleados VARCHAR(50)
);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    id_organizacion INT NOT NULL,
    identificador_seudonimo VARCHAR(255) UNIQUE NOT NULL,
    pais_residencia VARCHAR(100),
    fecha_registro DATE,
    CONSTRAINT fk_usu_org FOREIGN KEY (id_organizacion) REFERENCES organizacion(id_organizacion)
);

CREATE TABLE brecha_seguridad (
    id_brecha SERIAL PRIMARY KEY,
    id_organizacion INT NOT NULL,
    codigo_brecha VARCHAR(50) UNIQUE NOT NULL,
    vector_ataque VARCHAR(100),
    severidad VARCHAR(50),
    fecha_ocurrencia DATE,
    fecha_deteccion DATE,
    registros_afectados INT,
    costo_estimado NUMERIC(15, 2),
    CONSTRAINT fk_brecha_org FOREIGN KEY (id_organizacion) REFERENCES organizacion(id_organizacion)
);

CREATE TABLE tipo_dato (
    id_tipo_dato SERIAL PRIMARY KEY,
    categoria_informacion VARCHAR(100) UNIQUE NOT NULL,
    categoria_sensibilidad VARCHAR(50) NOT NULL
);

CREATE TABLE exposicion_usuario (
    id_usuario INT NOT NULL,
    id_brecha INT NOT NULL,
    id_tipo_dato INT NOT NULL,
    fecha_notificacion DATE,
    PRIMARY KEY (id_usuario, id_brecha, id_tipo_dato),
    CONSTRAINT fk_exp_usu FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_exp_brecha FOREIGN KEY (id_brecha) REFERENCES brecha_seguridad(id_brecha),
    CONSTRAINT fk_exp_tipo_dato FOREIGN KEY (id_tipo_dato) REFERENCES tipo_dato(id_tipo_dato)
);

-- 3. Índices para Optimización de Consultas
CREATE INDEX idx_brecha_fecha_sev ON brecha_seguridad(fecha_deteccion, severidad);
CREATE INDEX idx_tipo_dato_sensibilidad ON tipo_dato(categoria_sensibilidad);
CREATE INDEX idx_exposicion_brecha ON exposicion_usuario(id_brecha);
CREATE INDEX idx_exposicion_usuario ON exposicion_usuario(id_usuario);
CREATE INDEX idx_exposicion_tipo_dato ON exposicion_usuario(id_tipo_dato);