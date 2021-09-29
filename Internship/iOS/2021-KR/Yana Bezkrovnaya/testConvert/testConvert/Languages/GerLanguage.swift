//
//  GerLanguage.swift
//  convertNumberToAnOrdinalNumberString
//
//  Created by mac on 27.09.2021.
//

import Foundation

class GerLanguage : LanguageProtocol {
    let zero: String
    let hundred: String
    let thousand: String
    let million: String
    let billion: String
    let trillion: String
    
    let numbersToTwenty: [Int : String]
    let ordinalToTwenty: [Int : String]
    let tens: [Int : String]
    
    let numberParts: NumberParts
    
    init(numberParts: NumberParts) {
        self.numberParts = numberParts
        
        zero = "null"
        hundred = "hundert"
        thousand = "tausend"
        million = "million"
        billion = "milliard"
        trillion = "billion"
        
        numbersToTwenty = [
            1: "ein",
            2: "zwei",
            3: "drei",
            4: "vier",
            5: "fünf",
            6: "sechs",
            7: "sieben",
            8: "acht",
            9: "neun",
            10: "zehn",
            11: "elf",
            12: "zwölf",
            13: "dreizehn",
            14: "vierzehn",
            15: "fünfzehn",
            16: "sechzehn",
            17: "siebzehn",
            18: "achtzehn",
            19: "neunzehn"
        ]
        tens = [
                20: "zwanzig",
                30: "dreißig",
                40: "vierzig",
                50: "fünfzig",
                60: "sechzig",
                70: "siebzig",
                80: "achtzig",
                90: "neunzig"
        ]
        ordinalToTwenty = [
            1: "erste",
            2: "zweite",
            3: "dritte",
            4: "vierte",
            5: "fünfte",
            6: "sechste",
            7: "siebte",
            8: "achte",
            9: "neunte",
            10: "zehnte",
            11: "elfte",
            12: "zwölfte",
            13: "dreizehnte",
            14: "vierzehnte",
            15: "fünfzehnte",
            16: "sechzehnte",
            17: "siebzehnte",
            18: "achtzehnte",
            19: "neunzehnte"
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
                if hundreds > 1 {
                    result = result + (numbersToTwenty[hundreds] ?? "")
               }
                result += getPartName(partIndex: 0)
                
                if index == 0 && tens == 0 {
                    result += "ste"
                    continue
                }

            }
            
            if tens != 0 {
                if tens <= 19 {
                    if index == 0 {
                        result =  result + (ordinalToTwenty[tens] ?? "")
                    } else {
                        result = result + (numbersToTwenty[tens] ?? "")
                        
                        if tens == 1 {
                            result += "e"
                        }
                        if numberParts.getLastPart() != index {
                            result += " "
                        }
                    }
                } else {
                    
                    if index == 0 {
                        if tens % 10 == 0 {
                            result = result + (self.tens[tens] ?? "")
                        } else {
                            result = result + (numbersToTwenty[tens % 10] ?? "") + "und"
                            result = result + (self.tens[tens - tens % 10] ?? "")
                        }
                        result += "ste"
                        continue
                    } else {
                        result = result + (numbersToTwenty[tens % 10] ?? "") + "und"
                        result = result + (self.tens[tens - tens % 10] ?? "")
                    }
                    
                }
            }
            
            if index > 0 {
                if numberParts.getLastPart() == index {
                    if index == 3 {
                        result += "e"
                    }
                    result += "ste"
                    continue
                }
                
                result = result + " " + getPartName(partIndex: index)
                if tens > 1, index > 1 {
                    result += "en"
                }
                if index > 1 {
                    result += " "
                }
            }
        }
        return result
    }
}
