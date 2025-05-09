object cosas {}

object knightRider {
    method peso() = 500

    method nivelPeligrosidad() = 10  
}

object bumblebee {
    var estado = auto
    method peso() =  800
    method nivelPeligrosidad() = estado.nivelPeligrosidad()
    method transformarse() {
      estado = estado.nuevoEstado()
    }   
    
}

object auto {
  method nivelPeligrosidad() = 15
  method nuevoEstado() = robot  
}

object robot {
  method nivelPeligrosidad() = 30
  method nuevoEstado() =  auto
}

object ladrillos {
  var property cantidad = 0 
  method peso() = cantidad * 2
  method nivelPeligrosidad() = 2  
}

object arena {
    var property peso = 0
    method nivelPeligrosidad() = 1  
}

object bateriaAntiaerea {
  var tieneMisiles = false
  method nivelPeligrosidad() = if(tieneMisiles) 100 else 0
  method peso() = if(tieneMisiles) 300 else 200 
  method cargarMisiles() {tieneMisiles = true}
  method descargarMisiles() {tieneMisiles = false}
}

object contenedor {
    const contenido = []
    method peso() = 100 + contenido.sum({c=>c.peso()}) 
    method nivelPeligrosidad() = if(contenido.isEmpty()) 0 else contenido.max({c=>c.nivelPeligrosidad()}).nivelPeligrosidad()
}

object residuos {
  var property peso = 0
  method nivelPeligrosidad() = 0 
}

object embalajeSeguridad {
    var property envoltura = residuos    
    method peso() = envoltura.peso()
    method nivelPeligrosidad() = envoltura.nivelPeligrosidad() / 2
}
