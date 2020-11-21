import wollok.game.*
import Laberinto.*

class Muro{
	var property position	
	var property image = "Muro.png"	
	var property esAtravesable = false
}

object muros{
	
	method cargarMuros(){
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		const posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		[4,13,19].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[2,3,4,6,7,8,10,11,13,14,15,16,17,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[6,10,17,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[4,8,14,17,19,23].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[2,4,6,7,8,10,11,12,23].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[2,6,10,14,15,16,17,18,19,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[2,3,4,5,6,8,10,12,13,14,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[2,6,7,8,10,13,17,21,23].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2,4,10,12,13,15,16,17,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[1,2,4,5,6,7,8,9,10,12,17,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[4,6,9,14,15,16,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[1,2,4,6,8,9,11,12,14,19,21,23].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2,4,9,12,13,14,16,17,18,19,21].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2,4,7,12,14,18,21].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[6,7,8,10,12,16].forEach{n => posParedes.add(new Position(x=n, y=1))}
		
		posParedes.forEach { p => self.dibujar(new Muro(position = p)) }	
	}	
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
	method colisionar(){
	}
}

object introJuego{
	var property position = game.at(0,0)
	var property image = "IntroJuego.jpg"
}

object homeroWin{
	var property position = game.origin()
	var property image = "HomeroWin2.jpg"
}

object finalWin{
	var property position = game.at(11.5,0)
	var property image = "FinalWin.png"
}
object rosquilla{
	var property position = game.at(23,9)
	var property esAtravesable = true
	var property image = "Rosquilla.png"
		
	method colisionar(){
		game.say(homero, "Bart me cambio la verdadera rosquilla!")
		game.say(homero, "Bart me cambio la verdadera rosquilla!")
		game.say(homero, "Bart me cambio la verdadera rosquilla!")
		game.removeVisual(self)
		game.addVisual(rosquilla2)
		game.addVisual(rosquilla3)
	}	
}
object rosquillaTrampa{
	var property position  = game.at(20,1)
	var property esAtravesable = true
	var property image = "Rosquilla.png"
		
	method colisionar(){
		game.removeVisual(self)
		game.addVisual(barney)		
		game.say(barney, "Homero, vamos a lo de moe")
		game.say(barney, "Homero, vamos a lo de moe")
		game.say(barney, "Homero, vamos a lo de moe")
		game.say(homero, "No puedo ahora Barney!")
		game.say(homero, "No puedo ahora Barney!")
		game.say(homero, "No puedo ahora Barney!")
	}
}
object rosquilla2{
	var property position = game.at(3,16)
	var property esAtravesable = true
	var property image = "Rosquilla.png"
		
	method colisionar(){
		game.say(homero, "ñam ñam, esta es la verdadera")
		game.say(homero, "ñam ñam, esta es la verdadera")
		game.removeVisual(self)
		homero.tieneRosquilla(true)
	}	
}
object rosquilla3{
	var property position = game.at(7,9)
	var property esAtravesable = true
	var property image = "Rosquilla.png"
		
	method colisionar(){
		game.removeVisual(self)
		game.addVisual(burns)
		game.say(burns, "Asi que yendote antes del trabajo!")
		game.say(burns, "Asi que yendote antes del trabajo!")	
		game.say(burns, "Asi que yendote antes del trabajo!")	
		game.say(burns, "Asi que yendote antes del trabajo!")	
		game.say(burns, "Asi que yendote antes del trabajo!")	
		game.say(burns, "Asi que yendote antes del trabajo!")		
		game.say(barney, "Homero, presiona la r y no caigas de nuevo")
		game.say(barney, "Homero, presiona la r y no caigas de nuevo")	
		game.say(barney, "Homero, presiona la r y no caigas de nuevo")
		game.say(barney, "Homero, presiona la r y no caigas de nuevo")
		game.say(barney, "Homero, presiona la r y no caigas de nuevo")
		game.say(barney, "Homero, presiona la r y no caigas de nuevo")
	}	
}
object barney{
	var property position = game.at(20,1)
	var property image = "Barney.png"
	var property esAtravesable = true
	
	method colisionar(){
	}
}
object burns{
	var property position = game.at(8,10)
	var property image = "Burns.png"
	var property esAtravesable = false
	
	method colisionar(){
	}
}


object casa{
	var property position = game.at(12,8)	
	var property image = "Casa.png"
	var property esAtravesable = true
	
	method colisionar(){
		if (homero.tieneRosquilla()){
			game.say(homero, "Ganamos!")
			nivel.ganar()
		}else{
			game.say(homero, "Espera, todavia no tengo la rosquilla")
		}
	}
}

object homero{	
	var property position = game.at(1,3)
	var property image = "HomeroR.png"
	var property tieneRosquilla = false
	
	
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method mover(unaOrientacion){
		image = unaOrientacion.imagenDelJugador()
		
		if (not(movimiento.puedeMoverAl(unaOrientacion))){
			self.position(unaOrientacion.opuesto().posicionEnEsaDireccion())
			//game.say(self, "Ouch!")
		}
	}
}

object movimiento{

	 method puedeMoverAl(unaOrientacion){
		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion()).all{unObj => unObj.esAtravesable()}
	}
	
	method configurarFlechas(){
		keyboard.up().onPressDo{homero.mover(arriba)}
		keyboard.down().onPressDo{homero.mover(abajo)}
		keyboard.left().onPressDo{homero.mover(izquierda)}
		keyboard.right().onPressDo{homero.mover(derecha)}
   }
}

object arriba{
	method imagenDelJugador() = homero.image()
	method posicionEnEsaDireccion() = homero.position().up(1)
	method opuesto() = abajo
}

object abajo{
	method imagenDelJugador() = homero.image()
	method posicionEnEsaDireccion() = homero.position().down(1)
	method opuesto() = arriba
}

object izquierda{
	method imagenDelJugador() = "Homero.png"
	method posicionEnEsaDireccion() = homero.position().left(1)
	method opuesto() = derecha	
}

object derecha{
	method imagenDelJugador() = "HomeroR.png"
	method posicionEnEsaDireccion() = homero.position().right(1)
	method opuesto() = izquierda
}

