//
//  CalcLogic.swift
//  Crnch
//
//  Created by Jake Hirzel on 11/27/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import Foundation

struct CalcLogic {
    
    // Create running total variable with public getter and private setter access level
    public private(set) var runningTotal: Float = 0.0
    
    // Enumerate the available operations
    enum CalcType: String {
        case addition = "+"
        case subtraction = "−"
        case multiplication = "×"
        case division = "÷"
        case squareRoot = "√"
        case negation = "+/−"
        case total = "="
    }
    
    // Create mutating function to modify the runningTotal based on the desired operation
    mutating func nextCalc(perform nextOperation: CalcType, by nextNumber: Float = 0.0) {
        
        switch nextOperation {
        case .addition:
            runningTotal += nextNumber
        case .subtraction:
            runningTotal -= nextNumber
        case .multiplication:
            runningTotal *= nextNumber
        case .division:
            guard nextNumber != 0 else {
                print("Error. Div/0.")
                return
            }
            runningTotal /= nextNumber
        case .squareRoot:
            guard runningTotal >= 0 else {
                print("Error. Square Root of a Negative.")
                return
            }
            runningTotal = sqrt(runningTotal)
        case .negation:
            runningTotal = -runningTotal
        case .total:
            return
        }
        
    }
    
}
