object heladera{
    method precio() = 200000
    method esElectrodomestico() = true
    method esComida() = false
}
object cama{
    method precio() = 80000
    method esElectrodomestico() = false
    method esComida() = false
}
object tiraAsado{
    method precio() = 3500
    method esElectrodomestico() = false
    method esComida() = true
}
object fideos{
    method precio() = 500
    method esElectrodomestico() = false
    method esComida() = true
}
object plancha{
    method precio() = 12000
    method esElectrodomestico() = true
    method esComida() = false
}
object kiloMilangas{
    method precio() = 2600
    method esElectrodomestico() = false
    method esComida() = true
}
object botellaSalsaTomate{
    method precio() = 900
    method esElectrodomestico() = false
    method esComida() = true
}
object microondas{
    method precio() = 42000
    method esElectrodomestico() = true
    method esComida() = false
}
object kiloCebollas{
    method precio() = 250
    method esElectrodomestico() = false
    method esComida() = true
}
object compu{
    method precio() = 500 * dolar.precioDeVenta()
}
object packComida{
    var plato = tiraAsado
    var aderezo = botellaSalsaTomate

    method precio() = plato.precio() + aderezo.precio()
    
    method plato(unPlato){
        plato = unPlato
    }
    method aderezo(unAderezo){
        aderezo = unAderezo
    }
}

object dolar{
    method precioDeVenta() = 1500
}