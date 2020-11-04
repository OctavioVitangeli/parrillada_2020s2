import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida){return unaComida.esAbundante()}

	method comer(comida){ comidas.add(comida)}
	
	method satisfecho(){ return self.pesoTotal() >= self.peso() * 0.01}
	
	method pesoTotal(){ return comidas.sum({ c => c.peso()})}
}

class Vegetariano inherits Comensal{ 
	override method leAgrada(unaComida){  return unaComida.aptoVegetaiano() and unaComida.valoacion() > 85}
	override method satisfecho(){ return super() and  not comidas.all({comida => comida.esAbundante() }) }
}

class HambrePopular inherits Comensal{
	override method leAgrada(unaComida){ return unaComida.esAbundante()}
	
}

class PaladarFino inherits Comensal{
	 override method leAgrada(unaComida){ return unaComida.peso().between(150,300) and unaComida.valoracion() > 100}
	 override method satisfecho(){ return super() and comidas.size().even()}
}