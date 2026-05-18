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

MATCH(a:Estudiante) , (b:Estudiante)
WHERE a.id = row.estudiante_origen AND b.id = row.estudiante_destino
CREATE (a)-[:AMIGO_DE]->(b);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/inscripciones.csv'
AS row

MATCH(a:Estudiante) , (b:Materia)
WHERE a.id = row.estudiante_id AND b.id = row.materia_id
CREATE (a)-[:INSCRITO_EN {Calificaion:row.calificacion}]->(b);


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Hermosillo19/refs/heads/main/data/imparticiones.csv' AS row

MATCH(a:Profesor) , (b:Materia)
WHERE a.id = row.profesor_id AND b.id = row.materia_id
CREATE (a)-[:IMPARTE]->(b);