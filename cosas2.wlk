object cosas {}

object knightRider {
    method peso() = 500

    method nivelPeligrosidad() = 10  

    method bulto(){
        return 1
    }

    method consecuenciaCarga(){

    }
}

object bumblebee {
    var estado = auto
    method peso() =  800
    method nivelPeligrosidad() = estado.nivelPeligrosidad()
    method transformarse() {
      estado = estado.nuevoEstado()
    }  

    method bulto(){
        return 2
    }
    
    method consecuenciaCarga(){
        estado = robot
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

  method bulto() =
    if (cantidad <= 100) 1
    else if(cantidad.between(101,300)) 2
    else 3

//    method bultoSinIf() = (2.min(1.max(cantidad-99))).max(3.min(cantidad))

  method consecuenciaCarga(){
    cantidad = cantidad + 12
  }
}

object arena {
    var property peso = 0
    method nivelPeligrosidad() = 1 
    method bulto(){
        return 1
    }

    method consecuenciaCarga(){
        peso = (peso - 10).max(0)
    }
}

object bateriaAntiaerea {
  var tieneMisiles = false
  method nivelPeligrosidad() = if(tieneMisiles) 100 else 0
  method peso() = if(tieneMisiles) 300 else 200 
  method cargarMisiles() {tieneMisiles = true}
  method descargarMisiles() {tieneMisiles = false}
  method bulto(){
    if (tieneMisiles) return 2
    else return 1
  }

  method consecuenciaCarga(){
    self.cargarMisiles()
  }
}

object contenedor {
    const contenido = []
    method peso() = 100 + contenido.sum({c=>c.peso()}) 
    method nivelPeligrosidad() = if(contenido.isEmpty()) 0 else contenido.max({c=>c.nivelPeligrosidad()}).nivelPeligrosidad()
    method bulto(){
        return 1 + contenido.sum({c => c.bulto()})
    }

    method consecuenciaCarga(){
        contenido.forEach({c => c.consecuenciaCarga()})
    }
}

object residuos {
  var property peso = 0
  method nivelPeligrosidad() = 0 
  method bulto(){
    return 1
  }

  method consecuenciaCarga(){
    peso = peso + 15
  }
}

object embalajeSeguridad {
    var property envoltura = residuos    
    method peso() = envoltura.peso()
    method nivelPeligrosidad() = envoltura.nivelPeligrosidad() / 2
    method bulto(){
        return 2
    }

    method consecuenciaCarga(){

    }
}
