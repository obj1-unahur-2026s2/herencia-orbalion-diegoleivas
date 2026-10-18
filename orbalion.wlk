// equipos

class Equipo {
    const nombre
    const nivelEnergiaBase
    const entrenador
    const tecnologiasComplementarias=[]
    method cantTotalEnergiasComplementarias()= tecnologiasComplementarias.sum({t=>t.valorEnergetico()})
    method todasLaTecnologiasActivas()=tecnologiasComplementarias.all({t=>t.activa()})
    method energiaTotal () = nivelEnergiaBase + self.cantTotalEnergiasComplementarias()
    method nivelEnergiaBase() = nivelEnergiaBase
    method esDePrestigioUniversal()


}

class Luminico inherits Equipo {
    const nivelRadiacion
    const nombreDeCristales =[] // strings
    override method energiaTotal () =  super() * if(nivelRadiacion<5000) 1.10 else 1
    method cantidadDeCristalesSolares()=nombreDeCristales.size()
    override method esDePrestigioUniversal()=  self.cantidadDeCristalesSolares()>=3 and entrenador.esDeElite()  and self.cantTotalEnergiasComplementarias()>=1

}

class Sintetico inherits Equipo {
    const nivelProcesamiento
    const modulosActivos
    const estaCertificado
    override method energiaTotal () = super () * if(modulosActivos>5) 0.80 else 1
    override method esDePrestigioUniversal()=  estaCertificado and modulosActivos>3 and self.todasLaTecnologiasActivas()

}
class Eterico inherits Equipo {
    const nivelDeFluctuacion
    const cantidadDePortales
    override method esDePrestigioUniversal()= nivelDeFluctuacion>75 and cantidadDePortales>=2 and self.cantTotalEnergiasComplementarias()>=2
    override method energiaTotal () =  super() * if(self.esDePrestigioUniversal()) 1.15 else 1
}


// entrenadores

class Entrenador {
    const cantidadCiclosSolares
    const estaEnSintonia
    const nivelDePrecision
    var rol
    method nivelDePrecision()=nivelDePrecision
    method estaEnSintonia()=estaEnSintonia
    method asignarRol(unRol) {
        if(not foz.rolesHomologados().contains(unRol) )
          self.error("Rol no homologado")
        rol=unRol  
    }

    method esDeElite()= cantidadCiclosSolares>10 and rol.cumpleCondicion(self)
}


// tecnologias

class TecnologiasEspeciales {
    const nombre
    const valorEnergetico
    const activa
    method valorEnergetico()=valorEnergetico
    method activa()=activa
    
  
}

// entidad

object foz{
    const rolesHomologados=[estrategaCuantico,arquitectoDeEnergia,guiaMental]
    method agregarRol(unRol){
        rolesHomologados.add(unRol)
    }
    method quitarRol(unRol) {
        rolesHomologados.remove(unRol)
    }
     
    method rolesHomologados()= rolesHomologados

}

// roles


object estrategaCuantico{
    method cumpleCondicion(unEntrenador) = unEntrenador.nivelDePrecision()>80

}
object arquitectoDeEnergia{

 method cumpleCondicion(unEntrenador) = unEntrenador.estaEnSintonia()
}

object guiaMental{

     method cumpleCondicion(unEntrenador) = true


}

object barrileteCosmico{

}



