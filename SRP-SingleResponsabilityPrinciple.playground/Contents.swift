
// SRP - Single Responsability Principle
// Uma classe deve ter um, e somente um, motivo para existir.

import Foundation

class TwitterManager {
    private func request() -> Data {
        // Faz sua requisição para a API do Twitter
        return Data()
    }
    
    private func convertJsonToModel(with data: Data) -> [AnyObject] {
        // Faz o parse do seu JSON
        return [AnyObject]()
    }
    
    private func saveInCoreData(with models: [AnyObject]) {
        // Salva o modelo no seu Core Data
    }
    private func create() {
        let data = request()
        let model = convertJsonToModel(with: data)
        saveInCoreData(with: model)
    }
}

// Qual o problema deste código?
// Como podemos perceber, a classe acima apresenta muitas responsabilidades desde o Request para seu endPoint até salvar localmente no banco de dados local. Isso se torna ainda pior caso você utilize por exemplo um Alamofire e CoreData como frameworks.

// Como podemos resolver este problema?
// Separando as responsabilidades, criando classes que tenham apenas uma responsabilidade em vez de uma que é a "faz tudo". Desse modo você mantém a alta coesao e baixo acoplamento entre as classes, e ainda por cima consegue fazer teste unitário muito mais acertivos, testando diretamente os métodos já que eles não são privados.

// Como ficaria o código utilizando o SOLID:

class RequestManager {
    public func request() -> Data {
        // Faz sua requisição para a API do Facebook
        return Data()
    }
}

class ParseManager {
    public func convert(with data: Data) -> [AnyObject] {
        // Faz o parse do seu JSON
        return [AnyObject]()
    }
}

class CoreDataManager {
    func save(with models: [AnyObject]) {
        // Salva o modelo no seu Core Data
    }
}

class FBManager {
    
    
    
    private func create() {
        let data = request()
        let model = convertJsonToModel(with: data)
        saveInCoreData(with: model)
    }
}
