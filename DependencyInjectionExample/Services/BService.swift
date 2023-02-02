import Foundation

struct BService: BServiceProtocol {
    func checkInput(_ input: String) -> Bool {
        input == "okay"
    }
}
