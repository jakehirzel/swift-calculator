//
//  KeyTapLogic.swift
//  Crnch
//
//  Created by Jake Hirzel on 12/3/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import UIKit

struct KeyTapLogic {
    
    // TODO: Factor out updating output and removing trailing zeroes; implement guards instead of if lets
    
    // Create CalcLogic() instance to handle operations
    var calcLogic = CalcLogic()
    
    mutating func keypadButtonTapped(_ button: UIButton, mainOutputIn: String, operationLogIn: OperationLog) -> OperationLog {
        
        // Check key title against OperandsAndOperators and unwrap
        if let keyTapped = OperandsAndOperators(rawValue: (button.titleLabel?.text)!) {
            
            // Create an Operation and assign operationLogIn to a working OperationLog variable
            var currentOperation = Operation(number: mainOutputIn, operation: keyTapped, mainOutput: mainOutputIn)
            var currentOperationLog = operationLogIn
            
            // Appropriately route a valid key tap based on the type of key (i.e. operands, operators, etc...)
            switch keyTapped {
            
            // Handle number taps
            case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point:
                
                // Only allow one .
                if button.titleLabel!.text == "." && mainOutputIn.contains(".") == true {
                    currentOperationLog.operationLog.append(currentOperation)
                    return currentOperationLog
                }
                                    
                // Otherwise add the characters to the number, update mainOutput, and append to the log
                else {
                    currentOperation.number.append(button.titleLabel!.text!)
                    currentOperation.mainOutput = currentOperation.number
                    currentOperationLog.operationLog.append(currentOperation)
                    return currentOperationLog
                }
                
            // Handle binary operation taps and clear
            case .addition, .subtraction, .multiplication, .division:
                
                // Return if log is empty
                if currentOperationLog.operationLog.isEmpty {
                    return currentOperationLog
                }
                
                // Safely unwrap, cast number in currentOperation as a Float
                if let nextNumber = Float(currentOperation.number) {
                    
                    // Pass to nextCalc()
                    calcLogic.nextCalc(perform: keyTapped, by: nextNumber)
                    
                    // Update mainOutput with runningTotal
                    currentOperation.mainOutput = String(calcLogic.runningTotal)
                    
                    // Remove trailing .0 from float cast to string, if any
                    if currentOperation.mainOutput[currentOperation.mainOutput.index(currentOperation.mainOutput.endIndex, offsetBy: -1)] == "0" && currentOperation.mainOutput[currentOperation.mainOutput.index(currentOperation.mainOutput.endIndex, offsetBy: -2)] == "." {
                        currentOperation.mainOutput.removeLast(2)
                    }
                    
                    // Update log
                    currentOperationLog.operationLog.append(currentOperation)
                    
                    return currentOperationLog
                    
                }
                else {
                    return currentOperationLog
//                    return (mainOutputOut: mainOutputIn, operation: keyTapped)
                }
                
            // Handle unary operation taps
            case .negation, .squareRoot, .clear:

                // Return if log is empty
                if currentOperationLog.operationLog.isEmpty {
                    return currentOperationLog
                }
                
                // Pass to nextCalc()
                calcLogic.nextCalc(perform: keyTapped)

                // Update mainOutput with runningTotal
                currentOperation.mainOutput = String(calcLogic.runningTotal)
                
                // Remove trailing .0 from float cast to string, if any
                if currentOperation.mainOutput[currentOperation.mainOutput.index(currentOperation.mainOutput.endIndex, offsetBy: -1)] == "0" && currentOperation.mainOutput[currentOperation.mainOutput.index(currentOperation.mainOutput.endIndex, offsetBy: -2)] == "." {
                    currentOperation.mainOutput.removeLast(2)
                }
                
                // Update log
                currentOperationLog.operationLog.append(currentOperation)
                
                return currentOperationLog

            // Handle total
            case .total:

                // Return if log is empty
                if currentOperationLog.operationLog.isEmpty {
                    return currentOperationLog
                }

                // Update mainOutput with runningTotal
                currentOperation.mainOutput = String(calcLogic.runningTotal)
                
                // Remove trailing .0 from float cast to string, if any
                if currentOperation.mainOutput[currentOperation.mainOutput.index(currentOperation.mainOutput.endIndex, offsetBy: -1)] == "0" && currentOperation.mainOutput[currentOperation.mainOutput.index(currentOperation.mainOutput.endIndex, offsetBy: -2)] == "." {
                    currentOperation.mainOutput.removeLast(2)
                }
                
                // Update log
                currentOperationLog.operationLog.append(currentOperation)

                return currentOperationLog

            // Handle info
            case .info:
                
                // TODO: Add info pane
                return currentOperationLog

            }
            
        }
        
        // Gracefully return if unwrap fails
        else {
            print("Key not included in OperandsAndOperators!")
            return operationLogIn
        }
        
    }
    
}

