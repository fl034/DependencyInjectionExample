import XCTest
@testable import DependencyInjectionExample

final class AServiceTests: XCTestCase {

    // Convention: Always name the tested class variable `sut`
    // sut <=> System Under Test
    var sut: AService!
    // Convention: Here force unwrap is allowed.
    var bServiceMock: BServiceMock!
    
    override func setUpWithError() throws {
        bServiceMock = BServiceMock()
        // Inject mock class here, to be able to test AService without unknown side effects of BService.
        // Bservice has to be tested separately
        sut = AService(bService: bServiceMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        bServiceMock = nil
    }

    // Convention: `func testFunctionName_input_expectedOutput()`
    func testDoSomething_bServiceTrue_reversedInput() {
        // Given
        // With that we can check how AService behaves if BService returns true
        bServiceMock.checkInputReturn = true
        
        // When
        let result = sut.doSomething(input: "okay")
        
        // Then
        // Assert that mock was called with correct parameters
        XCTAssertEqual(bServiceMock.checkInputCalledWithInput, "okay")
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "yako")
    }
        
    func testDoSomething_bServiceFalse_nil() {
        // Given
        // With that we can check how AService behaves if BService returns false
        bServiceMock.checkInputReturn = false
        
        // When
        let result = sut.doSomething(input: "okay")
        
        // Then
        XCTAssertEqual(bServiceMock.checkInputCalledWithInput, "okay")
        XCTAssertNil(result)
    }
    
}

