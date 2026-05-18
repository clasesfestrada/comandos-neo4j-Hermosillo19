CREATE (e:Estudiante{id:"E100",nombre:"Alexa",carrera:"diseño",semestre:2});

MATCH (a:Estudiante) , (b:Materia)
WHERE a.id = "E100" AND b.id = "M001"
CREATE (a)-[:INSCRITO_EN{Calificaion:9}]->(b);

MATCH (e:Estudiante)
RETURN (e);

MATCH (m:Materia)
RETURN (m);

MATCH p=(:Estudiante)-[ :ES_AMIGO]->( :Estudiante)
RETURN p;

MATCH r = (:Estudiante)-[ :INSCRITO_EN]->( :Materia)
RETURN r;

MATCH r = (:Profesor)-[ :IMPARTE]->( :Materia)
RETURN r;

MATCH (e {id:"E100"})
SET e.semestre = 3
RETURN e

MATCH r = (:Estudiante {id:'E100'})-[ i:INSCRITO_EN]->( :Materia{id:'M001'})
SET i.Calificaion = 10
RETURN r;

MATCH (:Estudiante {id:'E100'})-[r:INSCRITO_EN]->(:Materia{id:'M001'}) 
DELETE r;

MATCH (e:Estudiante {id:'E001'})
DETACH DELETE e;