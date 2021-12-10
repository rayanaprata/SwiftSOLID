//: # The Liskov Substitution Principle (LSP) (Princípio da Substituição de Liskov)
//: ### As classes base devem ser substituíveis por suas classes derivadas.
//: Vamos observar o seguinte trecho de código:


protocol Bird {
    func setLocation(longitude: Double , latitude: Double)
}

protocol Flying {
    var altitudeToFly: Double? {get}
    func setAltitude(altitude: Double)
}

protocol FlyingBird: Bird, Flying {
    
}

class Penguin: Bird {
    func setLocation(longitude: Double, latitude: Double) {
        
    }
}

class Owl: FlyingBird {
    var altitudeToFly: Double?
    
    func setLocation(longitude: Double , latitude: Double) {
        
    }
    
    func setAltitude(altitude: Double) {
        
    }
}
