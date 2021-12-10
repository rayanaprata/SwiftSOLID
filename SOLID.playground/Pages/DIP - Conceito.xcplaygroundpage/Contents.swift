//: # The Dependency Inversion Principle (DIP) (Princípio da inversão da dependência)
//: ### Dependa de uma abstração e não de uma implementação.
//: DIP é bem parecido com o Pricípio de Aberto e Fechado (OCP) e é um princípio certo se você acredita em componentes reutilizaveis
//: Vamos observar o seguinte trecho de código:

protocol FileManager {
    func save(data:String)
}

class Handler {
    let fm: FileManager
    
    init(fm:FileManager) {
        self.fm = fm
    }
    
    func handle(string: String) {
        fm.save(data: string)
    }
}

class FilesystemManager: FileManager {
    func save(data: String) {
        // Open a file
        // Save the string in this file
        // Close the file
    }
}

class CloudFileManager: FileManager {
    func save(data: String) {
        
    }
}

Handler(fm: FilesystemManager())
/*:
 ## Qual o problema do código acima?
 Talvez olhando o código assim, você pensa: estou utilizando o Principio da Responsabilidade Única (SRP), mas e se o Handler necessitar de um "CloudManagerFile"?
 ## Como podemos resolver esse problema?
 Podemos criar um protocolo chamado "Storage" e a classe handler ter um objeto que é desse protocolo, fazendo assim a handler aceitar todas as classes que implementam este protocolo, fazendo assim ela ser bem mais reutilizável.
 
[DIP - Como Aplicar](@next)
 */
