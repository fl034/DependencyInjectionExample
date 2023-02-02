import Foundation

/// Services can be struct or class. Only Mocks n
struct AService: AServiceProtocol {
    // Don't forget to make this private
    private let bService: BServiceProtocol
    
    // Convention: Inject dependency in initializer, with an default parameter if possible.
    // This default value can also be provided by a factory class in the future.
    init(bService: BServiceProtocol = BService()) {
        self.bService = bService
    }
    
    func doSomething(input: String) -> String? {
        guard bService.checkInput(input) else {
            return nil
        }
        return String(input.reversed())
    }
}
