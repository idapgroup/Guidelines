//
//  UaLanguage.swift
//  convertNumberToAnOrdinalNumberString
//
//  Created by mac on 27.09.2021.
//

import Foundation

class UaLanguage : LanguageProtocol {
    let zero: String
    let hundred: String
    let thousand: String
    let million: String
    let billion: String
    let trillion: String
    
    let numbersToTwenty: [Int : String]
    let ordinalToTwenty: [Int : String]
    let tens: [Int : String]
    let numbersForComplexOrdinal: [Int : String]
    
    let numberParts: NumberParts
    
    init(numberParts: NumberParts) {
        self.numberParts = numberParts
        
        zero = "нуль"
        hundred = "с"
        thousand = "тисяч"
        million = "мільйон"
        billion = "мільярд"
        trillion = "більйон"
        
        numbersToTwenty = [
            1: "од",
            2: "дв",
            3: "три",
            4: "чотири",
            5: "п'ят",
            6: "шіст",
            7: "сім",
            8: "вісім",
            9: "дев'ять",
            10: "десять",
            11: "одинадцять",
            12: "дванадцять",
            13: "тринадцять",
            14: "чотирнадцять",
            15: "п'ятнадцять",
            16: "шістнадцять",
            17: "сімнадцять",
            18: "вісімнадцять",
            19: "дев'ятнадцять"
        ]
        tens = [
            10: "десяти",
            20: "двадцят",
            30: "тридцят",
            40: "сорок",
            50: "п'ятдесят",
            60: "шістдесят",
            70: "сімдесят",
            80: "вісімдесят",
            90: "дев'яност"
        ]
        ordinalToTwenty = [
            1: "перший",
            2: "другий",
            3: "третій",
            4: "четвертий",
            5: "п'ятий",
            6: "шостий",
            7: "сьомий",
            8: "восьмий",
            9: "дев'ятий",
            10: "десяти",
            11: "одинадцяти",
            12: "дванадцяти",
            13: "тринадцяти",
            14: "чотирнадцяти",
            15: "п'ятнадцяти",
            16: "шістнадцяти",
            17: "сімнадцяти",
            18: "вісімнадцяти",
            19: "дев'ятнадцяти"
        ]

        numbersForComplexOrdinal = [
            2: "двох",
            3: "трьох",
            4: "чотирьох",
            5: "п'яти",
            6: "шести",
            7: "семи",
            8: "восьми",
            9: "дев'яти"
        ]
        
    }
    
    func convert() -> String {
        if numberParts.getLastPart() == 10 {
            return zero
        }
        var result: String = ""
        let isComplexOrdinalNumber: Bool = numberParts.getLastPart() > 0  || numberParts.getTens(partIndex: 0) == 0 ? true : false
    
        for (index, partNumber) in numberParts.numberParts.enumerated().reversed() {

            if partNumber == 0 {
                continue
            }
            let hundreds = numberParts.getHundred(partIndex: index)
            let tens = numberParts.getTens(partIndex: index)

            if hundreds != 0 {
                if isComplexOrdinalNumber, index == numberParts.getLastPart() {
                    result = result + (numbersForComplexOrdinal[hundreds] ?? "") + "сот"
                    if tens == 0 { result += "ий" }
                } else {
                    if hundreds != 1 {
                        result = result + (numbersToTwenty[hundreds] ?? "")
                    }
                    
                    if hundreds == 2 { result += "i" }
                    
                    result += self.hundred
                    
                    if hundreds == 1 {
                        if index == 0, tens == 0 { result += "отий" }
                        else { result += "то" }
                    }
                    else if hundreds == 2 { result += "ті"}
                    else if hundreds == 3 || hundreds == 4 { result += "та" }
                    else if hundreds >= 5 { result += "от" }
                }
            }
            
            if tens != 0, !isComplexOrdinalNumber || (isComplexOrdinalNumber && !(numberParts.getLastPart() == index)) {
                if tens <= 19 {
                    if index == 0 {
                        result = result + " " + (ordinalToTwenty[tens] ?? "")
                        
                        if tens > 9 {
                            result += "й"
                        }
                    } else {
                        result = result + " " + (numbersToTwenty[tens] ?? "")
                    }
                } else {
                    
                    if index == 0 {
                        if tens % 10 == 0 {
                            result = result + " " + (self.tens[tens] ?? "")
                            result += tens != 40 ? "ий" : "овий"
                        } else {
                            result = result + " " + (self.tens[tens - tens % 10] ?? "")
                            
                            if tens / 10 == 2 || tens / 10 == 3 { result += "ь" }
                            else if tens / 10 == 9 { result += "o" }
                            
                            result = result + " " + (ordinalToTwenty[tens % 10] ?? "")
                            if tens % 10 > 9 {
                                result += "й"
                            }
                        }
                        continue
                    } else {
                        result = result + " " + (self.tens[tens - tens % 10] ?? "")
                        
                        if tens / 10 == 2 || tens / 10 == 3 { result += "ь" }
                        else if tens / 10 == 9 { result += "o" }
                        
                        result = result + " " + (numbersToTwenty[tens % 10] ?? "")
                    }
                    
                }
                
                if tens > 19 || tens < 10 {
                    if index == 1 {
                        if tens % 10 == 1 { result += "на" }
                        else if tens % 10 == 2 { result += "i" }
                    } else {
                        if tens % 10 == 1 { result += "ин" }
                        else if tens % 10 == 2 { result += "а" }
                    }
                }
                if tens % 10 == 5 || tens % 10 == 6 { result += "ь" }
                result += " "
            }
            
            if tens != 0, isComplexOrdinalNumber == true, index == numberParts.getLastPart() {
                if tens <= 19, tens != 1 {
                    if tens < 10 {
                        result = result + (numbersForComplexOrdinal[tens] ?? "")
                    } else {
                        result += (ordinalToTwenty[tens] ?? "")
                    }
                } else if tens > 19 {
                    result = result + (self.tens[tens - tens % 10] ?? "") + "и"
                    result += (numbersForComplexOrdinal[tens % 10] ?? "")
                }
                if numberParts.getLastPart() == index {
                    result += getPartName(partIndex: index)
                }
            }
            
            if index > 0 {
                if numberParts.getLastPart() == index {
                    result += "ний"
                    continue
                }
                
                result = result + getPartName(partIndex: index)
                
                if index == 1, (tens < 10 || tens > 19) {
                    if tens == 1 { result += "а" }
                    else if tens > 1, tens % 10 < 5  { result += "і" }
                } else {
                    if tens % 10 > 1, tens % 10 < 5 { result += "и" }
                    else if tens >= 5, (tens % 10 != 1 || tens == 11) { result += "ів" }
                }
                
                result += " "
            }
        }
        return result
    }
}
