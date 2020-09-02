import wollok.game.*

object muro{
	var property position = game.at(2,2)
	
	method image() = "Muro.png"
	
}

object rosquilla{
	var property position = game.center()
	
	method image() = "Rosquilla.png"
}

object casa{
	var property position = game.at(9,9)
	
	method image() = "Casa.png"
}

object homero{
	var property position = game.origin()
	
	method image() = "Homero.png"
	
	method subir(){
		position = position.up(1)
	}
	method bajar(){
		position = position.down(1)
	}
	method izquierda(){
		position = position.left(1)
	}
	method derecha(){
		position = position.right(1)
	}
}