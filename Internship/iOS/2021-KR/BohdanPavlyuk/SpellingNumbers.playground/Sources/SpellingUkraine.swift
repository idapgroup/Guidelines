//1 000 000 000 000 000 - квадриллион

import Foundation

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}

class SpellingNumbersInUkrainian {
    enum Tens: String, CaseIterable {
        case zero = ""
        case ten = "десять"
        case twentieth = "двадцять"
        case thirtieth = "тридцять"
        case forties = "сорок"
        case fifties = "п'ятьдесят"
        case sixty = "шістьдесят"
        case seventy = "сімдесят"
        case eighties = "вісімдесят"
        case nineties = "дев'яносто"
    }
    enum Millions1_9:String, CaseIterable {
        case zero = ""
        case first = "одно"
        case second = "двух"
        case third = "трьох"
        case four = "чотирьох"
        case five = "п'яти"
        case six = "шести"
        case seven = "семи"
        case eight = "восьми"
        case nine = "дев'яти"
    }
    enum Dozens10_20:String, CaseIterable {
        case zero = ""
        case first = "десятий"
        case second = "двадцятий"
        case third = "тридцятий"
        case four = "сороковий"
        case five = "п'ятдесятий"
        case six = "шістдесятий"
        case seven = "семидесятий"
        case eight = "восмидесятий"
        case nine = "дев'яностий"
    }
    enum Million100_1000:String ,CaseIterable{
        case zero = ""
        case first = "сто"
        case second = "двухсот"
        case third = "трьохсот"
        case four = "чотирьохсот"
        case five = "п'ятсот"
        case six = "шістьсот"
        case seven = "сімсот"
        case eight = "вісімсот"
        case nine = "дев'ятсот"
    }

    enum Tenth:String ,CaseIterable{
        case zero = ""
        case first = "десяти"
        case second = "двадцяти"
        case third = "тридцяти"
        case fourth = "сорока"
        case fifth = "п'ятдесяти"
        case sixth = "шістдесяти"
        case seventh = "сімдесяти"
        case eight = "вісімдесяти"
        case ninth = "дев'яносто"
       
    }
    enum NaturalNumberEnd:String ,CaseIterable{
        case zero = ""
        case first = "перший"
        case second = "другий"
        case third = "третій"
        case fourth = "четвертий"
        case fifth = "п'ятий"
        case sixth = "шостий"
        case seventh = "сьомий"
        case eight = "восьмий"
        case ninth = "дев'ятий"
        case tenth = "десятий"
    }
    enum NaturalNambers:String ,CaseIterable{
        case zero = ""
        case first = "один"
        case sekond = "два"
        case third = "три"
        case fourth = "чотири"
        case fifth = "п'ять"
        case sixth = "шість"
        case seventh = "сім"
        case eight = "вісім"
        case ninth = "дев'ять"
        case ten = "десять"
    }
    enum Dozens:String ,CaseIterable{
        case zero = ""
        case first = "надцять"
        case sekond = "двадцять"
        case third = "тридцять"
        case fourth = "сорока"
        case fifth = "п'ятьдесят"
        case sixth = "шістьдесят"
        case seventh = "сімдесят"
        case eight = "вісімдесят"
        case ninth = "дев'яносто"
    }
    enum Hundreds:String ,CaseIterable{
        case zero = ""
        case first = "сто"
        case sekond = "двісті"
        case third = "триста"
        case fourth = "чотириста"
        case fifth = "п'ятсот"
        case sixth = "шістьсот"
        case seventh = "сімсот"
        case eight = "вісімсот"
        case ninth = "дев'ятсот"
    }
    enum NaturalNamber1000:String ,CaseIterable{
        case zero = ""
        case first = " одна тисяча"
        case sekond = "дві тисячи"
        case third = "три тисячи"
        case fourth = "чотири тисячи"
        case fifth = "п'ять тисяч"
        case sixth = "шість тисяч"
        case seventh = "сім тисяч"
        case eight = "вісім тисяч"
        case ninth = "дев'ять тисяч"
    }
    enum NaturalBigNumber:String ,CaseIterable{
        case zero = ""
        case first = " одна"
        case sekond = "дві"
        case third = "три"
        case fourth = "чотири"
        case fifth = "п'ять"
        case sixth = "шість"
        case seventh = "сім"
        case eight = "вісім"
        case ninth = "дев'ять"
    }
    enum BigNumber11_20:String ,CaseIterable{
        case zero = ""
        case first = " одинадцять"
        case sekond = "дванадцять"
        case third = "тринадцять"
        case fourth = "чотирнадцять"
        case fifth = "п'ятьнадцять"
        case sixth = "шістьнадцять"
        case seventh = "сімнадцять"
        case eight = "вісімнадцять"
        case ninth = "дев'ятнадцять"
        case ten = "двадцять"
    }
    enum BigNumberEnd11_20:String ,CaseIterable{
        case zero = ""
        case first = " одинадцяти"
        case sekond = "дванадцяти"
        case third = "тринадцяти"
        case fourth = "чотирнадцяти"
        case fifth = "п'ятьнадцяти"
        case sixth = "шістьнадцяти"
        case seventh = "сімнадцяти"
        case eight = "вісімнадцяти"
        case ninth = "дев'ятнадцяти"
        case ten = "двадцяти"
    }
    enum HundredEnd:String ,CaseIterable{
        case zero = ""
        case first = "сотий"
        case sekond = "двухсотий"
        case third = "трьохсотий"
        case fourth = "чотирьохсотий"
        case fifth = "п'ятсотий"
        case sixth = "шестисотий"
        case seventh = "семисотий"
        case eight = "восьмисотий"
        case ninth = "дев'ятсотий"
        
    }
    let thousand = "тисяч"
    let thousends1 = "тисячний"
    let theEding = "надцятий"
    let millionEnd = "мільйон"
    let millionsEnd = "мільйонний"
    let billionEnd = "мільярдний"
    let trillionEnd = "трильйонний"
    let quardrillionEnd = "квадрільйонний"
    let million = "мільйонів"
    let billion = "мільярдів"
    let trillion = "трильйонів"
    
    func spelling(number: Int) -> String {
        // Тернарний оператор
        switch number {
        case (number % 10 ) == 0 ? number : 0:
            let digit1 = number.digits[1]
            let digit10 = number.digits[0]
            let result = "\(Dozens10_20.allCases[digit10].rawValue) \(NaturalNumberEnd.allCases[digit1].rawValue)"

            return result
        case 0...11:
            return NaturalNumberEnd.allCases[number].rawValue

        case 11...20:
            let secondDigit = number.digits[1]
            let result = NaturalNambers.allCases[secondDigit].rawValue + theEding
            
            return result
        case 20...99:
            let digit1 = number / 10
            let digit2 = number.digits[1]
            let result = "\(Tens.allCases[digit1].rawValue) \(NaturalNumberEnd.allCases[digit2].rawValue)"

            return result
        default:
            return ""
        }

    }
    
    func spellingHundres(number: Int) -> String{
        if (number % 100) == 0 {
            let digit1 = number.digits[2]
            let digit10 = number.digits[1]
            let digit100 = number.digits[0]
            let result = "\(HundredEnd.allCases[digit100].rawValue) \(Dozens.allCases[digit10].rawValue) \(NaturalNumberEnd.allCases[digit1].rawValue)"
            return result
        } else {
            let hundreds = number / 100
            let digits = number - (hundreds * 100)
            
            let result = Hundreds.allCases[hundreds].rawValue + " " + spelling(number: digits)
            
            return result
        }
    }
    
    func spellingBigNumber(thousands: Int, onlyThousands: Bool, end: String, end1: String) -> String {
        
        var result = ""
        
        let number = thousands / 1000
        
        if number > 0 && number <= 10 {
            
            if (thousands % 1000) == 0 || onlyThousands {
                result = "\(Millions1_9.allCases[number].rawValue + " " + end1)"
            } else {
                if end1 == thousends1 {
                    result = "\(NaturalNambers.allCases[number].rawValue)"
                    
                } else {
                    var endType = ""
                    switch number {
                    case 1:
                        endType = ""
                    case 2, 3, 4:
                        endType = "и"
                    default:
                        endType = " "
                    }
                    
                     result = "\(NaturalNambers.allCases[number].rawValue) \(end1)" + endType
                    
                }
            }
        }
        
        if number >= 11 && number <= 19 {
            
            if (thousands % 1000) == 0 || onlyThousands {
                let digit10 = number / 1000
                result = "\(BigNumberEnd11_20.allCases[digit10].rawValue + " " + end)"
                
            } else {
                let digit1 = number.digits[1]
                
                result = "\(BigNumber11_20.allCases[digit1].rawValue + " " + end1)"
            }
        }
        
        if number > 19 && number <= 99 {
            let digit1 = number.digits[1]
            let digit10 = number.digits[0]
            
            if (thousands % 1000) == 0 || onlyThousands {
                let digit10 = number.digits[1]
                let digit100 = number.digits[0]
                result = "\(Tenth.allCases[digit100].rawValue) \(Millions1_9.allCases[digit10].rawValue + " " + end1)"

            }
            
            result = "\(Tens.allCases[digit10].rawValue) \(NaturalBigNumber.allCases[digit1].rawValue + " " + end)"
        }
        
        if number >= 101 && number <= 110 && (thousands % 1000 ) != 0{
            let hundreds = number.digits[0]
            let digits = (number - 100)
            
            result = "\(Hundreds.allCases[hundreds].rawValue) \(NaturalNambers.allCases[digits].rawValue)"
        
        }else if ((thousands % 1000) == 0) && number >= 110 && !onlyThousands {
            let digit100 = number.digits[0]
            let digits10 = (number).digits[1]
           
            result = "\(Hundreds.allCases[digit100].rawValue) \(BigNumberEnd11_20.allCases[digits10].rawValue + " " + end)"
        }
        
        if number >= 111 && number <= 119 && (thousands % 1000) != 0{
            let hundreds = number.digits[0]
            let digit1 = (number - 100).digits[1]
            
            result = "\(Hundreds.allCases[hundreds].rawValue) \(BigNumber11_20.allCases[digit1].rawValue + " " + end1 )"
        }else if (thousands % 1000) == 0 && !onlyThousands {
           
            let digit10 = number.digits[1]
            let digit100 = number.digits[0]
            result = "\(Hundreds.allCases[digit100].rawValue) \(BigNumberEnd11_20.allCases[digit10].rawValue + " " + end)"
        }
        
        if number >= 120 && number < 1000 || number == 100 {
            var digit1 = number.digits[2]
            let digit10 = number.digits[1]
            let digit100 = number.digits[0]
            
            var endNumber = ""
            switch digit1 {
            case 1:
                digit1 = 0
                endNumber = "а"
            case 2, 3, 4:
                endNumber = "і"
            default:
                endNumber = ""
            }
            result = "\(Hundreds.allCases[digit100].rawValue) \(Dozens.allCases [digit10].rawValue) \(NaturalBigNumber.allCases[digit1].rawValue) \( end )"
            if (thousands % 100000) == 0 {
                endNumber = "ний"
               
                let digit100 = number.digits[0]
                result = "\(Million100_1000.allCases[digit100].rawValue + " " + end1)"
            }

            if (thousands % 10000) == 0 && thousands < 1000000{
                endNumber = "ний"
                let digit10 = number.digits[1]
                let digit1 = number.digits[2]
                let digit100 = number.digits[0]
                result = "\(Million100_1000.allCases[digit100].rawValue) \(Tenth.allCases[digit10].rawValue) \(Millions1_9.allCases[digit1].rawValue + " " + end1)"

            }

            if (thousands % 1000) == 0 && (thousands % 10000) != 0 && (thousands % 100000) != 0 || onlyThousands {
                endNumber = "ний"
                let  digit10 = number.digits[1]
                let digit1 = number.digits[2]
                let digit100 = number.digits[0]
                result = "\(Hundreds.allCases[digit100].rawValue) \(Dozens.allCases[digit10].rawValue) \(Millions1_9.allCases[digit1].rawValue + " " + end1)"
            }
           
        
//        if thousands == 1000000000000000 {
//            let result = "\(quardrillionEnd)"
        }
      
        return result
        
    }

    func finalSpelling0_999(number: Int) -> String {
        var value: String = ""
        if number <= 99 {
            value = spelling(number: number)
        } else if number >= 100 && number <= 999 {
            value = spellingHundres(number: number)
        }

        return value
    }
    func finalSpellingMillion(number:Int) -> String{
        var value: String = ""
        if number <= 99 {
            value = spelling(number:number)
        }else if number >= 100 && number <= 999 {
            value = spellingHundres(number: number)
        }else if number >= 1000 && number <= 99999{
            value = spellingBigNumber(thousands: number, onlyThousands: (number != 0),end: thousends1, end1: thousand)
        }else if number >= 1000000 && number <= 999999999 {
            value = spellingBigNumber(thousands: number, onlyThousands:(number != 0), end: millionEnd, end1: million)
        }else if number >= 1000000000 && number <= 999999999999 {
            value = spellingBigNumber(thousands: number, onlyThousands: (number != 0), end: trillionEnd, end1: million)
        }else if number >= 1000000000000 && number <= 99999999999999 {
            value = spellingBigNumber(thousands: number, onlyThousands: (number != 0), end: quardrillionEnd, end1: million)
        }
            
        return value
        
    }
    
    func generalSpellingThousands(number: Int) -> String {
        var value: String = ""
        
        let hundreds = number - ((number / 1000) * 1000)
        
        value = spellingBigNumber(thousands: number, onlyThousands: hundreds == 0, end: thousand, end1: thousends1)
        
        if hundreds > 0 {
            value = value + " " + finalSpellingMillion(number: hundreds)
        }
        
//        debugPrint(value)
        
        return value
    }
    
    func generalSpellingMillions(number: Int) -> String {
        let thousands = number - ((number / 1000000) * 1000000)
        var value: String = ""

         value = spellingBigNumber(thousands: number / 1000, onlyThousands: thousands == 0, end: million, end1: millionsEnd)

        if thousands > 0 {
            value = value + " " + generalSpellingThousands(number: thousands)
        }
        
        return value
    }
    
    func generalSpellingBillions(number: Int) -> String {
        var value: String = ""
        let thousands = number - ((number / 1000000000) * 1000000000)
        
//        debugPrint(thousands)

        value = spellingBigNumber(thousands: number / 1000000, onlyThousands: thousands == 0, end: billion, end1: billionEnd)
        
        if thousands > 0 {
            value = value + " " + generalSpellingMillions(number: thousands)
        }
        
        return value
    }
    
    func generalSpellingTrillions(number: Int) -> String {
        var value: String = ""
        let hundreds = number - ((number / 1000000000000) * 1000000000000)
//        debugPrint(number)
        
        value = spellingBigNumber(thousands: number / 1000000000, onlyThousands: hundreds == 0, end: trillion, end1: trillionEnd)
        if hundreds > 0 {
            value = value + " " + generalSpellingBillions(number: hundreds)
        }
        if number == 1000000000000000 {
           let result = "\(quardrillionEnd)"
            return result
        }
        return value
    }
    
    func generalSpelling(number: Int) {
        var value: String = ""
        if number < 1000 {
            value = finalSpellingMillion(number: number)
        } else if number >= 1000 && number < 1000000 {
            value = generalSpellingThousands(number: number)
        } else if number >= 1000000 && number < 1000000000 {
            value = generalSpellingMillions(number: number)
        } else if number >= 1000000000 && number < 1000000000000 {
            value = generalSpellingBillions(number: number)
        }else if number >= 1000000000000 && number <= 1000000000000000 {
            value = generalSpellingTrillions(number: number)
        }
        

        debugPrint(value)
    }
}
