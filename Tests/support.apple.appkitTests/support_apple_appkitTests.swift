import XCTest
@testable import support_apple_appkit

final class support_apple_appkitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(support_apple_appkit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
