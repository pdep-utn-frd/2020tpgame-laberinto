import wollok.game.*

import visuales.*

object prueba{
	method iniciar(){
		game.addVisual(muro)
		game.addVisual(casa)
		game.addVisual(rosquilla)
		game.addVisualCharacter(homero)
		game.start()
	}
}