# Examen 2: Modelamiento, Rendimiento y Optimización de Consultas

**Curso:** Tópicos Avanzados en Bases de Datos (TADB-202620)  
**Estudiante:** Julian  
**Institución:** Universidad Pontificia Bolivariana  
**Fecha:** Septiembre de 2026  

## Descripción del Proyecto
Este repositorio contiene la solución técnica al Examen 2 del curso. El objetivo principal es evaluar la capacidad para diseñar y poblar una base de datos relacional normalizada a partir de un dataset desestructurado (sábana de datos) sobre brechas de ciberseguridad, así como la optimización de consultas analíticas utilizando índices.

La infraestructura del proyecto está desplegada en un contenedor **Docker** corriendo **PostgreSQL 18.x** sobre una instancia de **Amazon EC2 (AWS)**.

## Archivos y Entregables

Este repositorio contiene los 4 entregables oficiales requeridos para la evaluación:

1. 📄 **`infraestructura.pdf`**: Documentación visual del despliegue del entorno en la nube, demostrando la instancia de AWS EC2 en ejecución, el contenedor de Docker activo y la conexión exitosa desde el cliente DBeaver.
2. 🖼️ **`diagrama_relacional.png`**: Diagrama Entidad-Relación (DER) extraído de DBeaver, mostrando las 5 tablas normalizadas (`organizacion`, `usuario`, `brecha_seguridad`, `tipo_dato`, `exposicion_usuario`) y sus respectivas relaciones de clave foránea.
3. 💾 **`tadb202620_examen02_modelo.sql`**: Script completo que contiene el esquema de datos, el DDL (Data Definition Language) de las tablas, la creación de los índices para optimización y las dos consultas SQL analíticas de las Etapas 3 y 4.
4. 📝 **`planes_ejecucion.docx`**: Informe técnico que incluye los requerimientos, el código SQL, las capturas de resultados y el análisis detallado de los planes de ejecución (`EXPLAIN ANALYZE`), demostrando la mejora en el rendimiento mediante el uso de índices de filtrado compuesto y *Bitmap Scans*.

## Tecnologías Utilizadas
* **Motor de Base de Datos:** PostgreSQL
* **Infraestructura Cloud:** Amazon Web Services (AWS EC2)
* **Contenerización:** Docker
* **Cliente SQL:** DBeaver Community Edition

## Instrucciones de Ejecución
Para reproducir el modelo de datos localmente:
1. Conéctese a una instancia de PostgreSQL.
2. Ejecute el archivo `tadb202620_examen02_modelo.sql` para crear el esquema, las tablas y los índices.
3. (Opcional) Importe los datos masivos (40.000 registros) a una tabla de paso y ejecute las sentencias `INSERT INTO ... SELECT DISTINCT` para poblar el modelo relacional.