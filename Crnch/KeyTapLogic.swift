//
//  KeyTapLogic.swift
//  Crnch
//
//  Created by Jake Hirzel on 12/3/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import UIKit

struct KeyTapLogic {
    
    func keypadButtonTapped(_ button: UIButton, mainOutputIn: String) -> (String) {
        
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
                    return mainOutputIn
                }
                    
//                    // Only allow two characters after a .
//                else if mainOutputIn.count > 3 && mainOutputIn[(mainOutputIn.index(mainOutputIn.endIndex, offsetBy: -3))] == "." {
//                    return mainOutputIn
//                }
                    
                    // Limit to thousands place (plus optional decimal and change)
                else if mainOutputIn.count == 5 && mainOutputIn.contains(".") == false && button.titleLabel?.text != "." {
                    return mainOutputIn
                }
                    
                    // Otherwise add the characters to the label
                else {
                    var mainOutputOut = mainOutputIn
                    mainOutputOut.append(button.titleLabel!.text!)
                    return mainOutputOut
                }
                
            // Handle binary operation taps and clear
            case .addition, .subtraction, .multiplication, .division, .clear:
                
                // Safely unwrap, cast mainOutputIn as a Float, and pass to nextCalc()
                if let nextNumber = Float(mainOutputIn) {
                    calcLogic.nextCalc(perform: keyTapped, by: nextNumber)
                    return ""
                }
                else {
                    return mainOutputIn
                }
                
            // Handle unary operation taps
            case .negation, .squareRoot:
                
                // TODO: Handle unary operations
                return mainOutputIn
            
            // Handle total
            case .total:
                return String(calcLogic.runningTotal)
            // Handle info
            case .info:
                
                // TODO: Add info pane
                return mainOutputIn

            }
            
        }
        
        // Gracefully return if unwrap fails
        else {
            print("Key not included in OperandsAndOperators!")
            return mainOutputIn
        }
        
    }
    
}

