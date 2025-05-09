import cosas.*

object camion {
    const cosasCargada = [arena, bumblebee ]

    method cargarCosa(unaCosa) {
      cosasCargada.add(unaCosa)
    }

    method descargarCosa(unaCosa) {
      cosasCargada.remove(unaCosa)
    }

    method pesoTotal() = 1000 + self.pesoCarga()
    method pesoCarga(){
      return cosasCargada.sum( {c => c.peso()} )
    }
    method tieneCosaConPeso(unPeso) = cosasCargada.any({c=>c.peso() == unPeso})

    method cosaMasPesada() = cosasCargada.max({c=>c.peso()})

    method todoPesoPar(){
      return cosasCargada.all({c => c.peso().even()})
    }

    method cosaConPeligrosidad(numeroPeligrosidad){
      return cosasCargada.find({c => c.peso() == numeroPeligrosidad})
    }


    method cosasConPeligrosidadMayorA(numeroPeligrosidad){
      return cosasCargada.filter({c => c.nivelPeligrosidad() > numeroPeligrosidad})
    }


    method cosasMasPeligrosasQue(unaCosa){
      self.cosasConPeligrosidadMayorA(unaCosa.nivelPeligrosidad())
    }


    method excedePesoPermitido(){

      return self.pesoTotal() > 2500
    }

    method puedeCircularEnRuta(nivelPeligrosidad){

     return not self.excedePesoPermitido() && self.cosasConPeligrosidadMayorA(nivelPeligrosidad).isEmpty()
    }

    method hayAlgoQuePesaEntre(minimo, maximo){
      return cosasCargada.any({e => e.peso().between(minimo, maximo)})
    }

    method cargar(unaCosa){
        self.cargarCosa(unaCosa)
        unaCosa.consecuenciaCarga()
    }
}