import XCTest

enum ValidationError: Error {
    case notMoreThan10Characters
    case doesNotContainMoreThan3Numerals
}

// パスワードが以下を満たしているか確認する
// - 10文字以上である
// - 数字を3文字以上含む
func validateWithThrowingError(password: String) throws {
    if password.count < 10 { throw ValidationError.notMoreThan10Characters }
    let numberOfDigits = password.filter { $0.isNumber }.count
    if numberOfDigits < 3 { throw ValidationError.doesNotContainMoreThan3Numerals }
}

final class ThrowingErrorTest: XCTestCase {
    func test_パスワードが10文字以上であること() {
        XCTAssertThrowsError(try validateWithThrowingError(password: "123abcdef")) { error in
            XCTAssertEqual(error as? ValidationError, ValidationError.notMoreThan10Characters)
        }

        XCTContext.runActivity(named: "数字が3文字含まれている") { _ in
            XCTContext.runActivity(named: "合計9文字入力された場合にnotMoreThan10Charactersを返すこと") { _ in
                XCTAssertThrowsError(try validateWithThrowingError(password: "123abcdef")) { error in
                    XCTAssertEqual(error as? ValidationError, ValidationError.notMoreThan10Characters)
                }
            }

            XCTContext.runActivity(named: "合計10文字入力された場合に何も返さないこと") { _ in
                XCTAssertNoThrow(try validateWithThrowingError(password: "123abcdefg"))
            }

            XCTContext.runActivity(named: "合計11文字入力された場合に何も返さないこと") { _ in
                XCTAssertNoThrow(try validateWithThrowingError(password: "123abcdefgh"))
            }
        }
    } // パスワードが10文字以上であること

    func test_パスワードが数字を3文字以上含むこと() {
        XCTContext.runActivity(named: "数字以外が9文字入力されている") { _ in
            XCTContext.runActivity(named: "数字が2文字入力された場合にdoesNotContainMoreThan3Numeralsを返すこと") { _ in
                XCTAssertThrowsError(try validateWithThrowingError(password: "abcdefghi12"))
            }

            XCTContext.runActivity(named: "数字が3文字入力された場合にtrueを返すこと") { _ in
                XCTAssertNoThrow(try validateWithThrowingError(password: "abcdefghi123"))
            }

            XCTContext.runActivity(named: "数字が4文字入力された場合にtrueを返すこと") { _ in
                XCTAssertNoThrow(try validateWithThrowingError(password: "abcdefghi1234"))
            }
        }
    } // パスワードが数字を3文字以上含むこと
}
