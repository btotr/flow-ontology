prefix flow: <http://flow.recipes/ns/core#> 
prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix dbo: <http://dbpedia.org/ontology/>

# get all recipes from dpedia with mayonaise as ingredient

SELECT  ?recipes
WHERE {

  ?recipe a recipe:Recipe .
  ?recipe rdfs:label "Mayonnaise"@nl .
  ?recipe owl:sameAs ?ingredient .
  
  SERVICE <http://dbpedia.org/sparql> {    
	?ingredient rdfs:label "Mayonnaise"@en .
	?recipes dbo:ingredient ?ingredient .
  }
}