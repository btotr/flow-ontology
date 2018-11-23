INSERT { 
	?idRecipe rdf:type    flow:Recipe;  
				 rdf:type owl:NamedIndividual .
	 ?idInstruction rdf:type flow:Instruction;
				 rdf:type owl:NamedIndividual ;
				 flow:hasMethod fs:grind .
} WHERE {
	BIND (UUID() AS ?idRecipe) .
	BIND (UUID() AS ?idInstruction) .
}