// IVAN BORGOGNONI 1491921 K3153 

// PRENDAS

class Prenda {
    const tipo
    const precioGeneral

    method precio()
}

class Nueva inherits Prenda {
    override method precio() = precioGeneral
}

class Descuento inherits Prenda {
    const descuentoAplicado

    override method precio() = precioGeneral - descuentoAplicado
}

class Liquidacion inherits Prenda {
    override method precio() = precioGeneral*0.5
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