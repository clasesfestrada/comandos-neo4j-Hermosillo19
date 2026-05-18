MATCH (:Estudiante{nombre:'Ana'})-[:ES_AMIGO]->(e:Estudiante)
RETURN e;

MATCH (:Estudiante{nombre:'Ana'})-[:ES_AMIGO]->(e:Estudiante)
MATCH (e:Estudiante)-[:INSCRITO_EN]->(m:Materia)
RETURN m;

MATCH (:Estudiante{nombre:'Ana'})-[:ES_AMIGO]->(e:Estudiante)
MATCH (e:Estudiante)-[:INSCRITO_EN]->(m:Materia)
MATCH (p:Profesor)-[ :IMPARTE]->( m:Materia)
RETURN p

MATCH (:Estudiante{nombre:'Ana'})-[:ES_AMIGO *2]->(e:Estudiante)
RETURN e

MATCH (e:Estudiante)-[i :INSCRITO_EN ]->( :Materia)
WHERE i.Calificaion>90
RETURN e