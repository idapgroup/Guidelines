import Foundation

public class SpellingNumbersInEnglish {

    enum NaturalNumbersEnd : String , CaseIterable {
        case zero = ""
        case first = "first"
        case second = "second"
        case third = "third"
        case fourth = "fourth"
        case fifth = "fifth"
        case sixth = "sixth"
        case seventh = "seventh"
        case eight = "eight"
        case ninth = "ninth"
        case tenth = "tenth"
    }
    enum NaturalNumbers : String , CaseIterable {
        case zero = ""
        case first = "one"
        case second = "two"
        case third = "three"
        case fourth = "four"
        case fifth = "five"
        case sixth = "six"
        case seventh = "seven"
        case eight = "eight"
        case ninth = "nine"
        case tenth = "one-"
    }
    enum Numbers11_20End : String , CaseIterable {
        case zero = ""
        case first = "eleventh"
        case second = "twelfth"
        case third = "thirteenth"
        case fourth = "fourteenth"
        case fifth = "fifteenth"
        case sixth = "sixteenth"
        case seventh = "seventeenth"
        case eight = "eighteenth"
        case ninth = "nineteenth"
        case tenth = "twentieth"
    }
    enum Numbers11_20 : String , CaseIterable {
        case zero = ""
        case first = "eleven"
        case second = "twelve"
        case third = "thirteen"
        case fourth = "fourteen"
        case fifth = "fifteen"
        case sixth = "sixteen"
        case seventh = "seventeen"
        case eigth = "eighteen"
        case ninth = "nineteen"
        case tenth = "twentie"
    }
    enum Numbers10_100 : String , CaseIterable {
        case zero = ""
        case first = "eleventh"
        case second = "twenty"
        case third = "thirty"
        case fourth = "fourty"
        case fifth = "fifty"
        case sixth = "sixty"
        case seventh = "seventy"
        case eigth = "eighty"
        case ninth = "ninety"
      
    }
    enum Numbers10_100End : String , CaseIterable {
        case zero = ""
        case first = "ten"
        case second = "twentieth"
        case third = "thirtieth"
        case fourth = "fortieth"
        case fifth = "fiftieth"
        case sixth = "sixtieth"
        case seventh = "seventieth"
        case eight = "eightieth"
        case ninth = "ninetieth"
       
    }
    
    enum Dozens : String , CaseIterable {
        case zero = ""
        case first = "ten"
        case second = "twenty"
        case third = "thirty"
        case fourth = "forty"
        case fifth = "fifty"
        case sixth = "sixty"
        case seventh = "seventy"
        case eight = "eighty"
        case ninth = "ninety"
        case tenth = "one hundred"
    }
    let hundredth = "hundredth"
    let hundred = "hundred"
    let thousand = "thousand"
    let thousends1 = "thousandth"
    let million = "million"
    let billion = "billion"
    let trillion = "trillion"
    let quadrillion = "quadrillionth"
    
    public init() {
            
    }
    
    func spelling(number: Int) -> String {
        var result = ""
        switch number {
        case (number % 10 ) == 0 ? number : 0:
            let digit1 = number.digits[1]
            let digit10 = number.digits[0]
            result = "\(Numbers10_100End.allCases[digit10].rawValue) \(NaturalNumbersEnd.allCases[digit1].rawValue)"
        case 0...10:
            result = NaturalNumbersEnd.allCases[number].rawValue
        case 10...20:
            result = Numbers11_20End.allCases[number.digits[1]].rawValue
        case 20...99:
            let digit1 = number / 10
            let digit2 = number.digits[1]
            result = "\(Numbers10_100.allCases[digit1].rawValue) \(NaturalNumbersEnd.allCases[digit2].rawValue)"
            
        default:
            result = ""
        }
        
        return result
    }
        func spellingHundres(number: Int) -> String{
            if (number % 100) == 0 {
                let digit1 = number.digits[2]
                let digit10 = number.digits[1]
                let digit100 = number.digits[0]
                let result = "\(NaturalNumbers.allCases[digit100].rawValue + " " + hundredth) \(Numbers10_100End.allCases [digit10].rawValue) \(NaturalNumbersEnd.allCases[digit1].rawValue)"
                
                return result
            } else {
                let hundreds = number / 100
                let digits = number - (hundreds * 100)
                let result = ((NaturalNumbers.allCases[hundreds].rawValue + " " + hundred) + " " + spelling(number: digits))
                
                return result
            }
        }
        func spellingBigNumber(thousands: Int, onlyThousands: Bool, end: String, end1: String) -> String {
            var result = ""
            let number = thousands / 1000
            
            if number > 0 && number <= 10 {
                
                if (thousands % 1000) == 0 {
                     result = "\(NaturalNumbers.allCases[number].rawValue  + " " + end1)"
                    
//                    return result
                } else {
                     result = "\(NaturalNumbers.allCases[number].rawValue + " " + end)"
                                    
//                    return result
                }
            }
            
            if number >= 11 && number <= 19 {
                
                if (thousands % 1000) == 0 {
                    let digit10 = number.digits[1]
                     result = "\(Numbers11_20End.allCases[digit10].rawValue)"
                    
//                    return result
                } else {
                    let digit1 = number.digits[1]
                    
                    result = "\(Numbers11_20.allCases[digit1].rawValue)"
                }
            }
            
            if number > 19 && number <= 99 {
                let digit1 = number.digits[1]
                let digit10 = number.digits[0]
                
                if (thousands % 1000) == 0 {
                    let digit10 = number.digits[1]
                    let digit100 = number.digits[0]
                     result = "\(NaturalNumbers.allCases[digit100].rawValue) \(NaturalNumbers.allCases[digit10].rawValue)"
                    
//                    return result
                }
                
                result =  "\(Dozens.allCases[digit10].rawValue) \(NaturalNumbers.allCases[digit1].rawValue)"
            }
            
            if number >= 101 && number <= 110 && (thousands % 1000 ) != 0{
                let hundreds = number.digits[0]
                let digits = (number - 100)
                
                result = "\(NaturalNumbers.allCases[hundreds].rawValue + " " + hundred) \(NaturalNumbers.allCases[digits].rawValue + " " + end)"
            
            }else if ((thousands % 1000) == 0) && number >= 110 && !onlyThousands {
                let digit100 = number.digits[0]
                let digits10 = (number).digits[1]
               
              result = "\(NaturalNumbers.allCases[digit100].rawValue + " " + hundred) \(Numbers10_100.allCases[digits10].rawValue + " " + end1)"
            }
            
            if number >= 111 && number <= 119 && (thousands % 1000) != 0{
                let hundreds = number.digits[0]
                let digit1 = (number).digits[1]
                
                result = "\(NaturalNumbers.allCases[hundreds].rawValue + " " + hundred) \(Numbers11_20.allCases[digit1].rawValue + " " + end )"
            }else if (thousands % 1000) == 0 {
               
                let digit10 = number.digits[1]
                let digit100 = number.digits[0]
                result = "\(NaturalNumbers.allCases[digit100].rawValue + " " + hundred) \(Numbers11_20.allCases[digit10].rawValue + " " + end1)"
            }
            
            if number >= 120 || number == 100 {
                var digit1 = number.digits[2]
                let digit10 = number.digits[1]
                let digit100 = number.digits[0]
                result = "\(NaturalNumbers.allCases[digit100].rawValue + " " + hundred) \(Dozens.allCases[digit10].rawValue) \(NaturalNumbers.allCases[digit1].rawValue + " " + end)"
                if (thousands % 1000000) == 0  {
                    let digit1 = number.digits[0]
                    result = "\(end1)"
                }
                if (thousands % 100000) == 0 && (thousands % 1000000) != 0 {

                   
                    let digit100 = number.digits[0]
                     result = "\((NaturalNumbers.allCases[digit100].rawValue + " " + hundred) + " " + end1)"

                }
                
                if (thousands % 10000) == 0 && (thousands % 100000) != 0{

                    let digit10 = number.digits[1]
                    let digit1 = number.digits[2]
                    let digit100 = number.digits[0]
                     result = "\(NaturalNumbers.allCases[digit100].rawValue + " " + hundred) \(Dozens.allCases[digit10].rawValue) \(NaturalNumbers.allCases[digit1].rawValue + " " + end1)"

                }

                if (thousands % 1000) == 0 && (thousands % 10000) != 0 && (thousands % 100000) != 0 {

                    let  digit10 = number.digits[1]
                    let digit1 = number.digits[2]
                    let digit100 = number.digits[0]
                    result = "\(NaturalNumbers.allCases[digit100].rawValue + " " + hundred) \(Dozens.allCases[digit10].rawValue) \(NaturalNumbers.allCases[digit1].rawValue + " " + end1)"

                }

            }
            
            return result
        }
      










        func finalSpellingMillion(number:Int) -> String{
            var value: String = ""
            if number <= 99 {
                value = spelling(number:number)
            }else if number >= 100 && number <= 999 {
                value = spellingHundres(number: number)
            }else if number >= 1000 && number <= 99999{
                value = spellingBigNumber(thousands: number, onlyThousands: (number != 0),end: thousand, end1: thousends1)
            }

            return value
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
        func generalSpellingThousands(number: Int) -> String {
            var value: String = ""
            
            let hundreds = number - ((number / 1000) * 1000)
            
            value = spellingBigNumber(thousands: number, onlyThousands: hundreds == 0, end: thousand, end1: thousends1)
            
            if hundreds > 0 {
                value = value + " " + finalSpellingMillion(number: hundreds)
            }
//
//            debugPrint(value)
            
            return value
        }
    func generalSpellingMillions(number: Int) -> String {
        let thousands = number - ((number / 1000000) * 1000000)
        var value: String = ""

         value = spellingBigNumber(thousands: number / 1000, onlyThousands: thousands == 0, end: million, end1: million)

        if thousands > 0 {
            value = value + " " + generalSpellingThousands(number: thousands)
        }
        
        return value
    }
    
    func generalSpellingBillions(number: Int) -> String {
        var value: String = ""
        let thousands = number - ((number / 1000000000) * 1000000000)
        
//        debugPrint(thousands)

        value = spellingBigNumber(thousands: number / 1000000, onlyThousands: thousands == 0, end: billion, end1: billion)
        
        if thousands > 0 {
            value = value + " " + generalSpellingMillions(number: thousands)
        }
        
        return value
    }
    
    func generalSpellingTrillions(number: Int) -> String {
        var value: String = ""
        let hundreds = number - ((number / 1000000000000) * 1000000000000)
//        debugPrint(number)
        
        value = spellingBigNumber(thousands: number / 1000000000, onlyThousands: hundreds == 0, end: trillion, end1: trillion)
        if hundreds > 0 {
            value = value + " " + generalSpellingBillions(number: hundreds)
        }
        if number == 1000000000000000 {
            let resalt = "\(quadrillion)"
            return resalt
        }
        return value
    }
    
    public func generalSpelling(number: Int) {
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
