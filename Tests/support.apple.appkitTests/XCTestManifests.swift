import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(support_apple_appkitTests.allTests),
    ]
}
#endif