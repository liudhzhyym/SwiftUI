//
//  CalculatorLogic.swift
//  SwiftUI_Calculator
//
//  Created by bakhaan on 2021/02/09.
//

import Foundation


class CalcCore {
    
    // 숫자
    var digit1: Double? = nil
    var digit2: Double? = nil
    // 결과
    var calculateResult: Double? = nil
    // 기호
    var rememberSymbol: String? = nil
    
    func calcLogic() -> Double? {
        switch rememberSymbol {
        case "+":
            calculateResult = digit1! + digit2!
        case "-":
            calculateResult = digit1! - digit2!
        case "+/-":
            calculateResult = -digit1!
        case "%":
            calculateResult = digit1! * 0.01
        default:
            break
        }
        
        return calculateResult
    }
}
