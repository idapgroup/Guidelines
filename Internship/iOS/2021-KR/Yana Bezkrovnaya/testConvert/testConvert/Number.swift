//
//  Number.swift
//  convertNumberToAnOrdinalNumberString
//
//  Created by mac on 25.09.2021.
//

import Foundation

protocol NumberPartsProtocol {
    
    func getHundred(partIndex: Int) -> Int
    
    func getTens(partIndex: Int) -> Int
    
    func getLastPart() -> Int
}

class NumberParts: NumberPartsProtocol {
    private(set) var numberParts: [Int] = []
    
    init(number: UInt64) {
        var numberV = number
        
        for _ in 0 ..< 5 {
            numberParts.append(Int(numberV % 1000))
            numberV /= 1000
        }
    }
    
    public func getHundred(partIndex: Int) -> Int {
        return numberParts[partIndex] / 100
    }
    
    public func getTens(partIndex: Int) -> Int {
        return numberParts[partIndex] % 100
    }
    
    public func getLastPart() -> Int {
        if numberParts[0] == 0 {
            
            if numberParts[1] == 0 {
                
                if numberParts[2] == 0 {
                    
                    if numberParts[3] == 0 {
                        
                        if numberParts[4] == 0 {
                            return 10
                        } else { return 4 }
                        
                    } else { return 3 }
                    
                } else { return 2 }
                
            } else { return 1 }
            
        } else { return 0 }
    }
}
