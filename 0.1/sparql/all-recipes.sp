prefix flow: <http://flow.recipes/0.1#> 
prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix recipe: <http://schema.org/Recipe#> 
prefix dbo: <http://dbpedia.org/ontology/>
prefix skos: <http://www.w3.org/2004/02/skos/core#> 

# all recipes

SELECT ?name
WHERE {
  ?recipe a recipe:Recipe .
  ?recipe rdfs:label ?name .
}
LIMIT 25