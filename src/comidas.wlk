class Comida {
	var property peso = 250
	var property esEspecial = true
	method esAptoVegetariano() = false	
	method esAbundante(){ return peso > 250}
	method valoracion(){ return 100}
					

}

class Provoleta inherits Comida  {
	var property tieneEspecias = true
	
	
	override method esAptoVegetariano(){
			return !(tieneEspecias)
			}								
	override method esEspecial(){return self.esAbundante() or tieneEspecias }
	
	override method valoracion(){return if (self.esEspecial()){120}
										else { 80}
		
	}
}

class HambueguesaDeCarne inherits Comida{
	var property panUtilizado 
	override method valoracion(){ return 60 + panUtilizado.valoracion()}
	
}

object panIndustrial{
	var property valoracion = 0
}
object panCasero{
	var property valoracion = 20
}
object panMasaMadre{
	var property valoracion = 45
}

class HamburguesaVegetariana inherits HambueguesaDeCarne {
	override method esAptoVegetariano(){ return true}
	override method valoracion(){ return super() + (2 * self.deQueEstaEcha().size()).min(17) }
	method deQueEstaEcha(){ return "garbanzos"}
}

class Parrillada{
	var property cortesPedidos = []
	method agregarCortes(corte){cortesPedidos.add(corte) }
	method aptoVegetariano(){ return false}
	method peso(){ cortesPedidos.sum({ cortes => cortes.peso()})}
	method valoracion(){return ((15 * self.elDeMayorValor() - cortesPedidos.size().max(0) ))}
	method elDeMayorValor(){ return cortesPedidos.max({ c=>c.calidad()}).calidad()}
}

class Corte{
	var property nombre = "asado"
	var property peso = 0
	var property calidad = 0

	
}









