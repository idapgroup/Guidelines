import Foundation

public class GeneralSpellingNumber {
    
    let ukraine = SpellingNumbersInUkrainian()
    let english = SpellingNumbersInEnglish()
    let german = SpellingNumbersInGerman()
    
    public init() {
        
    }

    public func generalSpelling (number:Int) {
        ukraine.generalSpelling(number:number)
        english.generalSpelling(number:number)
        german.generalSpelling(number:number)
    }
}
