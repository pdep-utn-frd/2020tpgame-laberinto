import wollok.game.*

import visuales.*

object laberintoHomero{
	method iniciar(){
		homero.configurarFlechas(derecha)
		game.addVisual(casa)
		game.addVisual(rosquilla)
		game.addVisualCharacter(homero)
		muros.cargarMuros()
		//game.whenCollideDo(homero, {elemento => elemento.colisionar(homero)})
		game.start()
	}
}
