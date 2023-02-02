import XCTest
@testable import DependencyInjectionExample

final class BServiceTests: XCTestCase {

    var sut: BService!
    
    override func setUpWithError() throws {
        sut = BService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCheckInput_okay_true() {
        // Given
        let input = "okay"
        
        // When
        let result = sut.checkInput(input)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testCheckInput_somethingElse_false() {
        // Given
        let input = "somethingElse"
        
        // When
        let result = sut.checkInput(input)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testCheckInput_empty_false() {
        // Given
        let input = ""
        
        // When
        let result = sut.checkInput(input)
        
        // Then
        XCTAssertFalse(result)
    }
}

