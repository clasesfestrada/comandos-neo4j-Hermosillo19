LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/materias.csv'
AS row

CREATE (:Materia {
  id: row.id,
  nombre: row.nombre,
  area: row.area
});


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/profesores.csv'
AS row

CREATE (:Profesor {
  id: row.id,
  nombre: row.nombre,
  departamento: row.departamento
});


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/amistades.csv'
AS row

CREATE (estudiante_origen)-[:Es_amigo]->(estudiante_destino);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/inscripciones.csv'
AS row

CREATE (estudiante_id)-[:Inscrito_en{Calificaion:toInteger(row.calificacion)}]->(materia_id);


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/imparticiones.csv' AS row

CREATE (profesor_id)-[:Imparte]->(materia_id);