import Foundation
@testable import DependencyInjectionExample

// Convention: Mocks have to be classes to be injected and changed from outside, namely our test functions.
// Convention: Mocks should be placed in the test target
// Convention: Mocks must have `Mock` as suffix.
class BServiceMock: BServiceProtocol {
    
    // Convention: Always Put those variables directly above the specific function.
    // Convention: Name those variables alwasys beginning with the function name
    var checkInputCalledWithInput: String?
    var checkInputReturn = false
    
    func checkInput(_ input: String) -> Bool {
        checkInputCalledWithInput = input
        return checkInputReturn
    }
}
