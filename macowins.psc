// IVAN BORGOGNONI 1491921 K3153 

// PRENDAS

class Prenda {
    const tipo
    const precio
    Estado estado

    method precio() = estado.precio(precio)
}

interface Estado {
    method precio(precio)
}

class Nueva implements Estado {
     method precio(precio) = precio
}

class Descuento implements Estado {
    const descuentoAplicado

    method precio(precio) = precio - descuentoAplicado
}

class Liquidacion implements Estado {
    method precio(precio) = precio*0.5
}


// VENTAS

class Renglon {
    const prenda
    const cantidad

    method importe() = prenda.precio() * cantidad
}

class Venta {
    const listaDeRenglones
    const fecha

    method importeSinRecargo() = listaDeRenglones.sum(renglon -> renglon.importe())

    method recargo() = 0

    method importeTotal = self.importeSinRecargo() + recargo()
}

class VentaConTarjeta inherits Venta {
    const cantidadDeCuotas

    override method recargo() = cantidadDeCuotas*coeficienteTarjeta + self.importeSinRecargo*0.01
}

// VENTAS DEL DIA

class RegistroDeVentas {
    const listaDeVentas

    method registrarVenta(venta) = listaDeVentas.add(venta)

    method ventasDelDia(fecha) = listaDeVentas.filter(venta -> venta.fecha(fecha))

    method gananciasDelDia(fecha) = self.ventasDelDia(fecha).sum(venta -> venta.importeTotal())
}