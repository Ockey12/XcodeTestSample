import XCTest
@testable import XcodeTestSample

final class PasswordValidatorTests: XCTestCase {
    // 10文字以上であること
    func test_数字が3文字含まれており_合計9文字入力された場合に_falseを返すこと() {
        XCTAssertFalse(validate(password: "123abcdef"))
    }

    func test_数字が3文字含まれており_合計10文字入力された場合に_trueを返すこと() {
        XCTAssertTrue(validate(password: "123abcdefg"))
    }

    func test_数字が3文字含まれており_合計11文字入力された場合に_trueを返すこと() {
        XCTAssertTrue(validate(password: "123abcdefgh"))
    }

    // 数字を3文字以上含むこと
    func test_数字以外を9文字と_数字が2文字入力された場合にfalseが返されること() {
        XCTAssertFalse(validate(password: "abcdefghi12"))
    }

    func test_数字以外を9文字と_数字が3文字入力された場合にtrueが返されること() {
        XCTAssertTrue(validate(password: "abcdefghi123"))
    }

    func test_数字以外を9文字と_数字が4文字入力された場合にtrueが返されること() {
        XCTAssertTrue(validate(password: "abcdefghi1234"))
    }
}
