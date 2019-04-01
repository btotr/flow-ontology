CONSTRUCT {
#  recipe	
	?recipeInstance a core:Recipe ;
				 a owl:NamedIndividual  ;
				core:instructions _:list ; 
				rdfs:label ?recipeName ;
	.
	_:list rdfs:member ?instruction .
#  instructions
	?instruction a core:Instruction ;
		a owl:NamedIndividual  ;
		core:hasComponentUnit [
			core:hasComponent ?ingredientConceptInstance ;
			core:weight ?weight ;
			core:componentAddition ?addition ;
		] ;
		core:hasMethod ?methodConceptInstance .
# method concepts
	?methodConceptInstance a skos:Concept .
	?methodConceptInstance skos:prefLabel ?method .
# ingredient concepts
	?ingredientConceptInstance a skos:Concept .
	?ingredientConceptInstance skos:prefLabel ?ingredient .
}
WHERE {
	BIND("Risotto" AS ?recipeName) .
	VALUES (?method ?weight ?ingredient ?addition)  {
		("fijnsnijden"  20 "ui" "1")
		("fruiten"  400 "risottorijst" UNDEF)
		("fruiten"  30 "boter" UNDEF)
		("afblussen" "100" "wijn" UNDEF) 
		("koken" "1,5L" "kippenbouilion" UNDEF) 
		("toevoegen" "75" "parmazaansekaas" UNDEF) 
		("toevoegen" "30" "boter" UNDEF) 
	}
# don't modify the following lines
	OPTIONAL {
		?methodConcept skos:prefLabel ?method . 
	} .
	BIND(IF(BOUND(?methodConcept), ?methodConcept, IRI(CONCAT("fs:",STR(NOW()), "-", ?method))) AS ?methodConceptInstance) .
	OPTIONAL {
		?ingredientConcept skos:prefLabel ?ingredient . 
	} .
	BIND(IF(BOUND(?ingredientConcept), ?ingredientConcept, IRI(CONCAT("fs:",STR(NOW()), "-", ?ingredient))) AS ?ingredientConceptInstance) .
	BIND( IRI(CONCAT("risotto:",STR(NOW()), "-", ?method)) AS ?instruction)
	BIND( IRI(CONCAT("risotto:",STR(NOW()))) AS ?recipeInstance)
}