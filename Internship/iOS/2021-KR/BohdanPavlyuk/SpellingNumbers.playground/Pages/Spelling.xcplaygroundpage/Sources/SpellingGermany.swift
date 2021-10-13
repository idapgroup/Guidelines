import Foundation

public class  SpellingNumbersInGerman {
    
    enum NaturalNumbers1_10:String, CaseIterable {
        case zero = ""
        case first = "eins"
        case second = "zwei"
        case third = "drei"
        case fourth = "vier"
        case fifth = "fünf"
        case sixth = "sechs"
        case seventh = "sieben"
        case eigth = "acht"
        case ninth = "neun"
        case tenth = "zehn"
    }
    enum NaturalNumbers1_10Dozens:String, CaseIterable {
        case zero = ""
        case first = "ein"
        case second = "zwei"
        case third = "drei"
        case fourth = "vier"
        case fifth = "fünf"
        case sixth = "sechs"
        case seventh = "sieben"
        case eigth = "acht"
        case ninth = "neun"
        case tenth = "zehn"
    }
    enum NaturalNumbers1_10End:String, CaseIterable {
        case zero = ""
        case first = "erste"
        case second = "zweite"
        case third = "dritter"
        case fourth = "vierte"
        case fifth = "fünfte"
        case sixth = "sechste"
        case seventh = "siebte"
        case eigth = "achte"
        case ninth = "neunte"
        case tenth = "zehntel"
    }
    enum NaturalNumbers11_20:String, CaseIterable {
        case zero = ""
        case first = "elf"
        case second = "zwölf"
        case third = "dreizehn"
        case fourth = "vierzehn"
        case fifth = "fünfzehn"
        case sixth = "sechzehn"
        case seventh = "siebzehn"
        case eigth = "achtzehn"
        case ninth = "neunzehn"
        case tenth = "zwanzig"
    }
    enum NaturalNumbers11_20End:String, CaseIterable {
        case zero = ""
        case first = "elfte"
        case second = "zwölfte"
        case third = "dreizehnte"
        case fourth = "vierzehnte"
        case fifth = "fünfzehnte"
        case sixth = "sechzehnter"
        case seventh = "siebzehnte"
        case eigth = "achtzehnte"
        case ninth = "neunzehnte"
        case tenth = "zwanzigstel"
    }
    enum NaturalNumbers10_100:String, CaseIterable {
        case zero = ""
        case first = "zehntel"
        case second = "zwanzigste"
        case third = "dreißigste"
        case fourth = "vierzigste"
        case fifth = "fünfzigste"
        case sixth = "sechzigste"
        case seventh = "siebzigste"
        case eigth = "achtzigste"
        case ninth = "neunzigste"
        case tenth = "hundertstel"
    }
    enum NaturalBigNumbersEnd:String, CaseIterable {
        case zero = ""
        case first = "zehn"
        case second = "zwanzig"
        case third = "dreißig"
        case fourth = "vierzig"
        case fifth = "fünfzig"
        case sixth = "sechzig"
        case seventh = "siebzig"
        case eigth = "achtzig"
        case ninth = "neunzig"
        case tenth = "hundert"
    }
    let EndNaturalNumber = "und"
    let hundred = "hundert"
    let ste = "ste"
    let thousand = "tausend"
    let stel = "stel"
    let thausandEnd = "tausendste"
    let zig = "zig"
    let zigThousend = "zigthousandste"
    let million = "million"
    let millionEnd = "millionste"
    let milliard = "milliarden"
    let milliardEnd = "milliardste"
    let trillion = "trillion"
    let trillionEnd = "trillionste"
    let zigster = "zigster"
    let quardllion = "quadrillionste"
    
    public init() {
            
    }
    
    func spelling(number: Int) -> String {
        var result = ""
    switch number {
    case (number % 10 ) == 0 ? number : 0:

        let digit10 = number.digits[0]
         result = "\(NaturalNumbers10_100.allCases[digit10].rawValue) "
        
    case 0...10:
        result = "\(NaturalNumbers1_10End.allCases[number].rawValue)"
    case 11...20:
        result = "\(NaturalNumbers11_20End.allCases[number.digits[1]].rawValue)"
    case 20...99:
        let digit1 = number.digits[1]
        let digit2 = number.digits[0]
         result = "\(NaturalNumbers1_10.allCases[digit1].rawValue + EndNaturalNumber + NaturalNumbers10_100.allCases[digit2].rawValue)"
        
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
            let result = "\(NaturalNumbers1_10.allCases[digit100].rawValue + hundred) \(NaturalNumbers1_10.allCases [digit10].rawValue + EndNaturalNumber) \(NaturalNumbers10_100.allCases[digit1].rawValue + ste)"
            
            return result
        } else {
            let hundreds = number / 100
            let digits = number - (hundreds * 100)
            let result = ((NaturalNumbers1_10.allCases[hundreds].rawValue + " " + hundred) + " " + spelling(number: digits))
            
            return result
        }
    }
    func spellingBigNumber(thousands: Int, onlyThousands: Bool, end: String, end1: String) -> String {
        var result = ""
        let number = thousands / 1000
        
        if number > 0 && number <= 10 {
        if (thousands % 1000) == 0 {
                 result = "\(NaturalNumbers1_10.allCases[number].rawValue  + end1 + stel)"
        } else {
                result = "\(NaturalNumbers1_10.allCases[number].rawValue + end)"
                        
            }
        }
        
        if number > 10 && number < 20 {
            let digit1 = number.digits[0]
            if (thousands % 1000) == 0 {
                let digit10 = number.digits[1]
                 result = "\(NaturalNumbers11_20End.allCases[digit10].rawValue + end1)"
              
            } else {
                let digit1 = number.digits[1]
                
                result = "\(NaturalNumbers11_20.allCases[digit1].rawValue + end1)"
            }
            result = "\(NaturalNumbers11_20.allCases[digit1].rawValue + end)"
           
            return result
        }
        
        if number > 19 && number <= 99 {
            let digit1 = number.digits[0]
            if (thousands % 1000) == 0 {

                let digit100 = number.digits[1]
                result = "\(NaturalNumbers1_10.allCases[digit100].rawValue + EndNaturalNumber + NaturalNumbers1_10.allCases[digit100].rawValue + end1)"
                

            }
            
            result = "\(NaturalNumbers1_10.allCases[digit1].rawValue + NaturalNumbers1_10.allCases[digit1].rawValue + end)"
        }
        
        if number >= 101 && number <= 110 && (thousands % 1000 ) != 0{
            let hundreds = number.digits[0]

            
            result = "\(NaturalNumbers1_10.allCases[hundreds].rawValue + hundred + NaturalNumbers1_10.allCases[hundreds].rawValue + end)"

        }else if ((thousands % 1000) == 0) && number >= 110 && !onlyThousands {

            let digits10 = (number).digits[1]
           
            result = "\(NaturalNumbers1_10.allCases[digits10].rawValue + hundred + NaturalNumbers1_10.allCases[digits10].rawValue + " " + end1)"
        }
        
        if number >= 111 && number <= 119 && (thousands % 1000) != 0{
            let hundreds = number.digits[0]

           
            result = "\(NaturalNumbers1_10.allCases[hundreds].rawValue + hundred + EndNaturalNumber + NaturalNumbers11_20.allCases[hundreds].rawValue + end )"

        }else if (thousands % 1000) == 0 && !onlyThousands {
           
            let digit10 = number.digits[1]

            result = "\(NaturalNumbers1_10.allCases[digit10].rawValue + hundred + EndNaturalNumber + NaturalNumbers11_20.allCases[digit10].rawValue + end1)"
        }
        
        if number >= 120 && number < 1000 || number == 100 {
            var digit1 = number.digits[2]
            let digit10 = number.digits[1]
            let digit100 = number.digits[0]

            result = "\(NaturalNumbers1_10.allCases[digit100].rawValue + hundred + NaturalNumbers1_10Dozens.allCases[digit1].rawValue + EndNaturalNumber + NaturalBigNumbersEnd.allCases[digit10].rawValue + end)"
            if (thousands % 100000) == 0 && (thousands % 1000000) != 0 {

               
                let digit100 = number.digits[1]
                 result = "\(NaturalNumbers1_10.allCases[digit100].rawValue + end1)"


            }

            if (thousands % 10000) == 0 && (thousands % 100000 ) != 0{

                let digit10 = number.digits[1]
    
                result = "\(NaturalNumbers1_10.allCases[digit10].rawValue + hundred)\(NaturalBigNumbersEnd.allCases[digit10].rawValue + end1) "
            }
           
            if (thousands % 1000) == 0 && (thousands % 10000) != 0   || onlyThousands {

                let digit100 = number.digits[0]
                result = "\(NaturalNumbers1_10.allCases[digit100].rawValue + hundred + NaturalNumbers1_10.allCases[digit1].rawValue + EndNaturalNumber + NaturalBigNumbersEnd.allCases[digit10].rawValue + end1)"
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
            value = spellingBigNumber(thousands: number, onlyThousands: (number != 0), end: thousand, end1: thausandEnd)
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
        
        value = spellingBigNumber(thousands: number, onlyThousands: hundreds == 0, end: thousand, end1: thausandEnd)
        
        if hundreds > 0 {
            value = value + " " + finalSpellingMillion(number: hundreds)
        }
        
        return value
    }
func generalSpellingMillions(number: Int) -> String {
    let thousands = number - ((number / 1000000) * 1000000)
    var value: String = ""

     value = spellingBigNumber(thousands: number / 1000, onlyThousands: thousands == 0, end: million, end1: millionEnd)

    if thousands > 0 {
        value = value + " " + generalSpellingThousands(number: thousands)
    }
  
    return value
}

func generalSpellingBillions(number: Int) -> String {
    var value: String = ""
    let thousands = number - ((number / 1000000000) * 1000000000)
    
   

    value = spellingBigNumber(thousands: number / 1000000, onlyThousands: thousands == 0, end: milliard, end1: milliardEnd)
    
    if thousands > 0 {
        value = value + " " + generalSpellingMillions(number: thousands)
    }
    
    return value
}

func generalSpellingTrillions(number: Int) -> String {
    var value: String = ""
    let hundreds = number - ((number / 1000000000000) * 1000000000000)

    
    value = spellingBigNumber(thousands: number / 1000000000, onlyThousands: hundreds == 0, end: trillion, end1: trillionEnd)
    if hundreds > 0 {
        value = value + " " + generalSpellingBillions(number: hundreds)
    }
    if number == 1000000000000000 {
        let result = "\(quardllion)"
        return result
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
//let ownerGer = SpellingNumbersInGerman()
//ownerGer.generalSpellingGer(number: 1000000000000000)
































