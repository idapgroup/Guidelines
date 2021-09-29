//
//  EngLanguage.swift
//  convertNumberToAnOrdinalNumberString
//
//  Created by mac on 26.09.2021.
//

import Foundation

class EngLanguage : LanguageProtocol {
    let zero: String
    let hundred: String
    let thousand: String
    let million: String
    let billion: String
    let trillion: String
    
    let numbersToTwenty: [Int : String]
    let tens: [Int : String]
    let ordinalToTwenty: [Int : String]
    
    let numberParts: NumberParts
    
    init(numberParts: NumberParts) {
        self.numberParts = numberParts
        
        zero = "zero"
        hundred = "hundred"
        thousand = "thousand"
        million = "million"
        billion = "billion"
        trillion = "trillion"
        
        numbersToTwenty = [
            1: "one",
            2: "two",
            3: "three",
            4: "four",
            5: "five",
            6: "six",
            7: "seven",
            8: "eight",
            9: "nine",
            10: "ten",
            11: "eleven",
            12: "twelve",
            13: "thirteen",
            14: "fourteen",
            15: "fifteen",
            16: "sixteen",
            17: "seventeen",
            18: "eighteen",
            19: "nineteen"
        ]
        tens = [
                20: "twent",
                30: "thirt",
                40: "fourt",
                50: "fift",
                60: "sixt",
                70: "sevent",
                80: "eight",
                90: "ninet"
        ]
        ordinalToTwenty = [
            1: "first",
            2: "second",
            3: "third",
            4: "fourth",
            5: "fifth",
            6: "sixth",
            7: "seventh",
            8: "eighth",
            9: "ninth",
            10: "tenth",
            11: "eleventh",
            12: "twelfth",
            13: "thirteenth",
            14: "fourteenth",
            15: "fifteenth",
            16: "sixteenth",
            17: "seventeenth",
            18: "eighteenth",
            19: "nineteenth"
        ]
    }
    
    func convert() -> String {
        if numberParts.getLastPart() == 10 {
            return zero
        }
        var result: String = ""
    
        for (index, partNumber) in numberParts.numberParts.enumerated().reversed() {

            if partNumber == 0 {
                continue
            }
            
            let hundreds = numberParts.getHundred(partIndex: index)
            let tens = numberParts.getTens(partIndex: index)

            if hundreds != 0 {
                result = result + (numbersToTwenty[hundreds] ?? "") + " " + getPartName(partIndex: 0)
                
                if index == 0 && tens == 0 {
                    result += "th "
                    continue
                }

            }
            
            if tens != 0 {
                if tens <= 19 {
                    result += " "
                    result += index == 0 ? ordinalToTwenty[tens] ?? "" : numbersToTwenty[tens] ?? ""
                    result += " "
                } else {
                    
                    if index == 0 {
                        if tens % 10 == 0 {
                            result = result + " " + (self.tens[tens] ?? "") + "ieth "
                        } else {
                            result = result +  " " + (self.tens[tens - tens % 10] ?? "") + "y "
                            result = result + (ordinalToTwenty[tens % 10] ?? "") + " "
                        }
                        continue
                    } else {
                        result = result + " " + (self.tens[tens - tens % 10] ?? "") + "y-"
                        result = result + (numbersToTwenty[tens % 10] ?? "") + " "
                    }
                    
                }
            }
            
            if index > 0 {
                result += getPartName(partIndex: index)
                result += numberParts.getLastPart() == index ? "th" : " "
            }
        }
        return result
    }
}
