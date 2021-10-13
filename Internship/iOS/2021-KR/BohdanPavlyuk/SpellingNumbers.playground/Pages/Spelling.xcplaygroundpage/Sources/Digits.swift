import Foundation

public extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
