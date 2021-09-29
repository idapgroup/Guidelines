//
//  Language.swift
//  convertNumberToAnOrdinalNumberString
//
//  Created by mac on 26.09.2021.
//

import Foundation

protocol LanguageProtocol {
    var zero: String { get }
    var hundred: String { get }
    var thousand: String { get }
    var million: String { get }
    var billion: String { get }
    var trillion: String { get }
    
    var numbersToTwenty: [Int : String] { get }
    var tens: [Int : String] { get }
    var ordinalToTwenty: [Int : String] { get }
    
    func convert() -> String
}

extension LanguageProtocol {
    func getPartName(partIndex: Int) -> String {
        if partIndex == 4 { return self.trillion }
        else if partIndex == 3 { return self.billion }
        else if partIndex == 2 { return self.million }
        else if partIndex == 1 { return self.thousand }
        else if partIndex == 0 { return self.hundred }
        return ""
    }
}
