//1 000 000 000 000 000 - квадриллион

//import Foundation

//Принципы ООП: инкапсуляция, насследования, полиморфизм та абстракция
//private public open internal fileprivate
//https://swiftbook.ru/content/languageguide/access-control/

//initialization в свифте
//protocol
//extension
//enum and struct
//class
//func
//variables

import Foundation

public class GeneralSpellingNumber {
  
    
    let ukraine = SpellingNumbersInUkrainian()
    let english = SpellingNumbersInEnglish()
    let german = SpellingNumbersInGerman()

    func generalSpelling (number:Int) {

        ukraine.generalSpelling(number:number)
        english.generalSpelling(number:number)
        german.generalSpelling(number:number)
    }
}
let generalOwner = GeneralSpellingNumber()
generalOwner.generalSpelling(number: 1000000000000000)
