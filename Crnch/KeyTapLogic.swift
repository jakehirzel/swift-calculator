//
//  KeyTapLogic.swift
//  Crnch
//
//  Created by Jake Hirzel on 12/3/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import UIKit

struct KeyTapLogic {
    
    func keypadButtonTapped(_ button: UIButton, keyTapped: OperandsAndOperators, mainOutputIn: String) -> (String) {
        
        switch keyTapped {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point:
            
            // Only allow one .
            if button.titleLabel!.text == "." && mainOutputIn.contains(".") == true {
                return mainOutputIn
            }
                
                // Only allow two characters after a .
            else if mainOutputIn.count > 3 && mainOutputIn[(mainOutputIn.index(mainOutputIn.endIndex, offsetBy: -3))] == "." {
                return mainOutputIn
            }
                
                // Limit to thousands place (plus optional decimal and change)
            else if mainOutputIn.count == 5 && mainOutputIn.contains(".") == false && button.titleLabel?.text != "." {
                return mainOutputIn
            }
                
                // Otherwise add the characters to both strings
            else {
                var mainOutputOut = mainOutputIn
                mainOutputOut.append(button.titleLabel!.text!)
                return mainOutputOut
            }

        case .addition, .subtraction, .multiplication, .division, .negation, .squareRoot, .total, .info:
            
            // TODO: Pass to CalcLogic & Update mainOutput
            return mainOutputIn
            
        }
        
    }
    
}

