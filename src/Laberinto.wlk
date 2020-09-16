import wollok.game.*

import visuales.*

object laberintoHomero{
	method iniciar(){
		muros.cargarMuros()
		movimiento.configurarFlechas()
		game.addVisual(casa)
		game.addVisual(rosquilla)
		game.addVisualCharacter(homero)
		game.whenCollideDo(homero, {elemento => elemento.colisionar()})
		game.start()
	}
}
