import wollok.game.*

import visuales.*


object nivel{
	
	method inicio(){
		game.clear()
		game.title("El laberinto de Homero")
		game.width(14)
		game.height(14)
		game.addVisual(introJuego)
		keyboard.enter().onPressDo{self.juego()}
}

	method juego(){
		game.clear()
		game.width(25)
		game.height(18)
		movimiento.configurarFlechas()
		muros.cargarMuros()
		game.addVisual(casa)
		game.addVisual(rosquilla)
		game.addVisualCharacter(homero)
		game.whenCollideDo(homero, {elemento => elemento.colisionar()})
	}
	
	method ganar(){
		game.clear()
		game.addVisual(homeroWin)
		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
	}
}

