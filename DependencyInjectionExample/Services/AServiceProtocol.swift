import Foundation

// Convention: Name it with `Protocol` as suffix
// Convention: Put the protocol in a separate file in the same folder as the Service
// Convention: Always create protocols, to allow dependent classes to quickly mock it. Only create mocks of your class if needed

protocol AServiceProtocol {
    
    func doSomething(input: String) -> String?
    
}
