import cuentas.*
import cosas.*
object casa {
  const cosas = [heladera, plancha, fideos, tiraAsado]
  var cuentaBancaria = cuentaCorriente

  method cantidadDeCosasCompradas() = cosas.size()
  method tieneComida() = cosas.any({c => c.esComida()})
  method vieneDeEquiparse() = cosas.last().esElectrodomestico() || cosas.last().precio() >= 50000
  method esDerrochona() = cosas.sum({c => c.precio()})
  
  // Si aún no se compró nada, falla. Pensar otro día eso.
  method compraMasCara() = cosas.find( {c => c.precio() == self.precioMasAltoDeCosasCompradas()} ) // santo dios lo pude pensar sin ayuda
  method preciosCosasCompradas() = cosas.map({c => c.precio()})
  method precioMasAltoDeCosasCompradas() = self.preciosCosasCompradas().max()

  method electrodomesticosComprados() = cosas.filter({c => c.esElectrodomestico()})
  method malaEpoca() = cosas.all({c => c.esComida()})
  method queFaltaComprar(lista) = lista.filter({c => !cosas.contains(c)})
  method faltaComida() = cosas.filter({c => c.esComida()}).size() < 2
  

  method dineroDisponible() = cuentaBancaria.saldo()
  method comprar(cosa){
    cosas.add(cosa)
    self.gastar(cosa.precio())
  }
  method gastar(importe){
    cuentaBancaria.extraer(importe)
  }
  
  method cuentaBancaria(unaCuenta){
    cuentaBancaria = unaCuenta
  }
}