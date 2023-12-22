import XCTest
@testable import XcodeTestSample

final class AsyncTests: XCTestCase {
    func test_2秒待って文字列を取得するのでtrueになること() {
        let expectation = XCTestExpectation(description: "非同期に文字列を取得する")

        Task {
            let string = await asyncTaskMethod()
            XCTAssertEqual(string, "文字列")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3)
    }

    func test_非同期処理で取得する文字列が一致しないのでfalseになること() {
        Task {
            let string = await asyncTaskMethod()
            XCTAssertEqual(string, "String")
        }
    }
}

