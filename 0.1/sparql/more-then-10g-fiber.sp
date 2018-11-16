prefix flow: <http://flow.recipes/ns/core#> 
prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix recipe: <http://schema.org/Recipe#> 
prefix dbo: <http://dbpedia.org/ontology/>
prefix skos: <http://www.w3.org/2004/02/skos/core#> 

# recipes which provide more than 10g fibers

SELECT  ?name (SUM(?normalisedFiber) AS ?totalFiber) 
WHERE {
  ?recipe a flow:Recipe .
  ?recipe rdfs:label ?name .
  # first instruction
  ?recipe flow:hasInstructions ?instruction .
  # get all ingredients
  ?instruction flow:hasInstruction*/flow:hasComponentUnit ?unit .
  ?unit flow:hasComponent ?ingredient .
  # normalise fiber
  ?unit flow:weight ?weight .
  ?ingredient <http://schema.org/fiberContent> ?fiber .
  BIND(xsd:float(?fiber)/100*?weight AS ?normalisedFiber)
}
GROUP BY ?name ?totalFiber
# only show recipes which provide more than 10g fibers 
HAVING (?totalFiber > 10)