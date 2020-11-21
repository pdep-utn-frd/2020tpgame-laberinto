import wollok.game.*

import visuales.*


object nivel{
	
	method inicio(){
		game.clear()
		homero.position(game.at(1,3))
		game.title("El laberinto de Homero")
		game.width(25)
		game.height(18)
		game.addVisual(introJuego)
		keyboard.enter().onPressDo{self.juego()}
}

	method juego(){
		game.clear()
		movimiento.configurarFlechas()
		muros.cargarMuros()
		game.addVisual(casa)
		game.addVisual(rosquilla)
		game.addVisual(rosquillaTrampa)
		game.addVisualCharacter(homero)
		keyboard.r().onPressDo{self.inicio()}
		game.whenCollideDo(homero, {elemento => elemento.colisionar()})
	}
	
	method ganar(){
		game.clear()
		game.addVisual(homeroWin)
		game.addVisual(finalWin)
		keyboard.f().onPressDo{self.inicio()}
		keyboard.s().onPressDo{game.stop()}
	}
}

