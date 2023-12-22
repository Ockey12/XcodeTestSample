import Foundation

// パスワードが以下を満たしているか確認する
// - 10文字以上である
// - 数字を3文字以上含む
func validate(password: String) -> Bool {
    if password.count < 10 { return false }
    let numberOfDigits = password.filter { $0.isNumber }.count
    return 3 <= numberOfDigits
}

// 2秒待って文字列を返す
func asyncTaskMethod() async -> String {
    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
    return "文字列"
}
