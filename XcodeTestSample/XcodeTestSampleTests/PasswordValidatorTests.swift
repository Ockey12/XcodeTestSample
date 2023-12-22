import XCTest
@testable import XcodeTestSample

final class PasswordValidatorTests: XCTestCase {
    func test_パスワードが10文字以上であること() {
        XCTContext.runActivity(named: "数字が3文字含まれている") { _ in
            XCTContext.runActivity(named: "合計9文字入力された場合にfalseを返すこと") { _ in
                XCTAssertFalse(validate(password: "123abcdef"))
            }

            XCTContext.runActivity(named: "合計10文字入力された場合にtrueを返すこと") { _ in
                XCTAssertTrue(validate(password: "123abcdefg"))
            }

            XCTContext.runActivity(named: "合計11文字入力された場合にtrueを返すこと") { _ in
                XCTAssertTrue(validate(password: "123abcdefgh"))
            }
        }
    } // パスワードが10文字以上であること

    func test_パスワードが数字を3文字以上含むこと() {
        XCTContext.runActivity(named: "数字以外が9文字入力されている") { _ in
            XCTContext.runActivity(named: "数字が2文字入力された場合にfalseを返すこと") { _ in
                XCTAssertFalse(validate(password: "abcdefghi12"))
            }

            XCTContext.runActivity(named: "数字が3文字入力された場合にtrueを返すこと") { _ in
                XCTAssertTrue(validate(password: "abcdefghi123"))
            }

            XCTContext.runActivity(named: "数字が4文字入力された場合にtrueを返すこと") { _ in
                XCTAssertTrue(validate(password: "abcdefghi1234"))
            }
        }
    } // パスワードが数字を3文字以上含むこと
}
