import wollok.game.*
import Laberinto.*

class Muro{
	var property position
	
	method image() = "Muro.png"
	
	method esAtravesable(){
		return false
	}
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
		
		
		[1,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[1,3,5,6,7,8,9,10,11,12,13,14,15,16].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[1,3,18,19,20,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[1,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[1,3,7,8,9,10,11,12,13,14,15,16,21,23].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[1,3,4,5,15,16,18,19,21,23].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[3,4,5,7,8,9,10,11,12,13,15,16,18,19,21,23].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[1,2,3,4,5,8,9,10,11,12,13,15,16,18,19].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[5,8,13,15,16,18,19,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2,3,5,8,10,11,12,13,16,18,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[2,3,5,8,10,11,12,13,14,16,18,19].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[2,3,8,14,16,18,19,20,21,22].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[2,3,4,5,6,8,9,10,11,12,14,18,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2,3,8,12,14,15,16,17,18,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2,3,5,6,7,8,9,10,12,22].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[12,13,14,15,16,17,18,19,20].forEach{n => posParedes.add(new Position(x=n, y=1))}
		
		 
		
		
		
	
		posParedes.forEach { p => self.dibujar(new Muro(position = p)) }	
	
	}	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	//method colisionar(homero){}
	
	method esAtravesable(){
		return false
	}
}

object rosquilla{
	var property position = game.at(20,4)
	
	method image() = "Rosquilla.png"
	
	method colisionar(homero){
		game.say(homero, "ñam ñam")
		game.removeVisual(self)
	}
	method esAtravesable(){
		return true
	}
}

object casa{
	var property position = game.at(12,8)
	
	method image() = "Casa.png"
}

object homero{
	
	var orientacion = derecha
	var position = self.position()
	var image = "Homero.png"
	
	
	method image() = image
	
	method position() = game.at(1,1)
	
	method arriba(){
		position = self.position().up(1)
		return position
	}		
	method abajo(){
		position = self.position().down(1)
	}		
	method izquierda(){
		position = self.position().left(1)
	}
	method derecha(){
		position = self.position().right(1)
	}
	
	
	 method puedeMoverAl(unaOrientacion){
		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion()).all{unObj => unObj.esAtravesable()}
	}
	
	method mover(posicion, unaOrientacion){
		orientacion = unaOrientacion
		image = orientacion.imagenDelJugador()
		if (self.puedeMoverAl(unaOrientacion)){
			unaOrientacion.posicionEnEsaDireccion()
		}
		else{
			game.say(self, "Ouch!")
		}
	}
	
	method configurarFlechas(unaOrientacion){
		keyboard.up().onPressDo{ self.mover(arriba.posicionEnEsaDireccion(),arriba)}
		keyboard.down().onPressDo{ self.mover(abajo.posicionEnEsaDireccion(),abajo)}
		keyboard.left().onPressDo{ self.mover(izquierda.posicionEnEsaDireccion(),izquierda)}
		keyboard.right().onPressDo{ self.mover(derecha.posicionEnEsaDireccion(),derecha)}
   }
}



object arriba{
	method imagenDelJugador() = homero.image()
	method posicionEnEsaDireccion() = homero.arriba()
}

object abajo{
	method imagenDelJugador() = homero.image()
	method posicionEnEsaDireccion() = homero.position().down(1)
}

object izquierda{
	method imagenDelJugador() = "Homero.png"
	method posicionEnEsaDireccion() = homero.position().left(1)
}

object derecha{
	method imagenDelJugador() = "HomeroR.png"
	method posicionEnEsaDireccion() = homero.position().right(1)
}