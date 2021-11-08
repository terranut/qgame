
function randomPhrase(_theme = "quiz"){
	
	if(_theme == "quiz"){
		return choose(
			"Genial",
			"Dabuten!!",
			"Soy el amo",
			"Vale, pero dame algo de comer",
			"Toma ya!",
			"Estupendo",
			"Soy el más listo",
			"Necesito ir al baño",
			"Sobrado!",
			"Fue fácil",
			"Acerté de coña",
			"Que suerte",
		)
	}else if(_theme == "medal"){
		return choose(
			"¿Que demonios?",
			"Venga, elige una y empieza",
			"Son muchas preguntas",
			"Yo tengo más medallas que tu",
			"¡No manches!",
			"¿A qué esperas?",
			"Me alimentas con zanahorias",
			"El tomate me da gases"
		)
		
	}
}