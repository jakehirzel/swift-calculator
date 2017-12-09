//
//  OperandsAndOperators.swift
//  Crnch
//
//  Created by Jake Hirzel on 12/3/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import Foundation

// Lay out all allowed operators and operands; use in switch statements to ensure all cases are covered

enum OperandsAndOperators: String {

    // All possible keypad characters
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case point = "."
    
    // All possible operations
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
    case squareRoot = "√"
    case negation = "+/-"
    case total = "="
    case clear = "AC"
    case info = "iOS info button"

}

