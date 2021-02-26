PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX dbpedia2: <http://dbpedia.org/property/>
PREFIX dbpedia: <http://dbpedia.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

DELETE {
  ?term owl:equivalentClass ?equiv .
        ?equiv rdf:type owl:Restriction ;
                  owl:onProperty ?p ;
                  owl:someValuesFrom ?thing .
}
INSERT {
  ?term rdfs:subClassOf ?equiv .
        ?equiv rdf:type owl:Restriction ;
                  owl:onProperty ?p ;
                  owl:someValuesFrom ?thing .
}

WHERE {
  ?term rdf:type owl:Class ;
  
   owl:equivalentClass ?equiv .
   ?equiv rdf:type owl:Restriction ;
                   owl:onProperty ?p ;
                   owl:someValuesFrom ?thing .
  
   FILTER(?p!=<http://purl.obolibrary.org/obo/IAO_0000136>)
   FILTER(isIRI(?term))
   FILTER(isIRI(?thing))
}