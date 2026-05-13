object cuentaCorriente{
    var saldo = 1000
    
    method saldo() = saldo
    method saldo(unSaldo){
        saldo = unSaldo //solo para el test
    }

    method depositar(importe){
        saldo += importe
    }
    method extraer(importe){
        saldo -= importe
    }
}
object cuentaConGastos{
    var saldo = 30000

    method saldo() = saldo
    method saldo(unSaldo){ //solo para el test
        saldo = unSaldo
    }

    method depositar(importe){
        saldo += importe-200
    }
    method extraer(importe){
        // saldo -= if(importe<=10000) importe+200 else importe+importe*0.02
        saldo -= if((importe<=10000).and(importe!=0)) self.importeSimple(importe, 200) else self.importePorcentual(importe,2) // no me termina de convencer.
    }
    method importeSimple(unImporte, unNum) = unImporte + unNum
    method importePorcentual(unImporte, unPorcentaje) = unImporte + (unImporte*(unPorcentaje/100))
}
object cuentaCombinada{
    var cuentaPrimaria = cuentaCorriente
    var cuentaSecundaria = cuentaConGastos

    method saldo() = cuentaPrimaria.saldo() + cuentaSecundaria.saldo()

    method depositar(importe){
        cuentaPrimaria.depositar(importe)
    }
    method extraer(importe){
        // if(cuentaPrimaria.salgo() >= importe){
        //     cuentaPrimaria.extraer(importe)
        // }
        // else{
        //     cuentaSecundaria.extraer(importe)
        // }

        const importePrimaria = (cuentaPrimaria.saldo() - importe).max(0)
        const importeSecundaria = (importe - importePrimaria).max(0)
        cuentaPrimaria.extraer(importePrimaria)
        cuentaSecundaria.extraer(importeSecundaria)
    }

    method cuentaPrimaria(unaCuenta){
        cuentaPrimaria = unaCuenta
    }
    method cuentaSecundaria(unaCuenta){
        cuentaSecundaria = unaCuenta
    }
}






