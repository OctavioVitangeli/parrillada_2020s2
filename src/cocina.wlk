import comidas.*
import comensales.*

object cocina{ 
	const property platos = [ ]
	
	method agregarPlato(comida){platos.add(comida) }
	
	method platoFuerteCarnivoro(){ return platos.find({ comida => not comida.aptoVegetariano().valoracion()}).max() }
	
	method cantidadPlatosVege(){return  platos.countanis({ plato => plato.aptoVegetariano()})}
	
	method cantidadPlatosCarni(){ return platos.countanis({ plato =>  not plato.aptoVegetariano()})}
	
	method tieneBuenaOfertaVege(){ return platos.cantidadPlatosVege().min(self.cantidadPlatosCarni()) <= 2  }
	
	method queComidaLeGustan(comensal){ platos.map({ plato => comensal.leAgrada()}) }
	
	method elegirPlato(comensal){ return  if (platos.anyone({ plato => plato.leAgrada()})){
		platos.remove(plato)
		comensal.comer()
	}
				else{ self.error("no me gusta nada")}
		}
}