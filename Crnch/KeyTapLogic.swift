//
//  KeyTapLogic.swift
//  Crnch
//
//  Created by Jake Hirzel on 12/3/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import UIKit

struct KeyTapLogic {
    
    func keypadButtonTapped(_ button: UIButton, mainOutputIn: String, operationLogIn: OperationLog) -> (mainOutputOut: String, operation: OperandsAndOperators?) {
        
        // Create CalcLogic() instance to handle operations
        var calcLogic = CalcLogic()
        
        // Check key title against OperandsAndOperators and unwrap
        if let keyTapped = OperandsAndOperators(rawValue: (button.titleLabel?.text)!) {
            
            // Appropriately route a valid key tap based on the type of key (i.e. operands, operators, etc...)
            switch keyTapped {
            
            // Handle number taps
            case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point:
                
                // Only allow one .
                if button.titleLabel!.text == "." && mainOutputIn.contains(".") == true {
                    return (mainOutputOut: mainOutputIn, operation: keyTapped)
                }
                    
                    // Limit to thousands place (plus optional decimal and change)
                else if mainOutputIn.count == 5 && mainOutputIn.contains(".") == false && button.titleLabel?.text != "." {
                    return (mainOutputOut: mainOutputIn, operation: keyTapped)
                }
                    
                    // Otherwise add the characters to the label
                else {
                    var mainOutputOut = mainOutputIn
                    mainOutputOut.append(button.titleLabel!.text!)
                    return (mainOutputOut: mainOutputOut, operation: keyTapped)
                }
                
            // Handle binary operation taps and clear
            case .addition, .subtraction, .multiplication, .division, .clear:
                
                // Check prior
                
                // Safely unwrap, cast mainOutputIn as a Float, and pass to nextCalc()
                if let nextNumber = Float(mainOutputIn) {
                    calcLogic.nextCalc(perform: keyTapped, by: nextNumber)
                    return (mainOutputOut: String(calcLogic.runningTotal), operation: keyTapped)
                }
                else {
                    return (mainOutputOut: mainOutputIn, operation: keyTapped)
                }
                
            // Handle unary operation taps
            case .negation, .squareRoot:
                
                // TODO: Handle unary operations
                return (mainOutputOut: mainOutputIn, operation: keyTapped)
            
            // Handle total
            case .total:
                return (mainOutputOut: String(calcLogic.runningTotal), operation: keyTapped)
            // Handle info
            case .info:
                
                // TODO: Add info pane
                return (mainOutputOut: mainOutputIn, operation: keyTapped)

            }
            
        }
        
        // Gracefully return if unwrap fails
        else {
            print("Key not included in OperandsAndOperators!")
            return (mainOutputOut: mainOutputIn, operation: nil)
        }
        
    }
    
}

