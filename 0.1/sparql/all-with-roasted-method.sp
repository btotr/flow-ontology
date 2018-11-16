prefix flow: <http://flow.recipes/ns/core#> 
prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 

#### all recipes which has roasting as methode

SELECT  ?name
WHERE {
  ?recipe a flow:Recipe .
  ?recipe rdfs:label ?name .
  ?recipe flow:hasInstructions ?instruction .
  ?instruction flow:hasInstruction*/flow:hasMethode/skos:prefLabel "roosteren"@nl .
}