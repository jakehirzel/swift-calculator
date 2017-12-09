//
//  ViewController.swift
//  Crnch
//
//  Created by Jake Hirzel on 11/11/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var mainOutputLabel: UILabel!
    
    @IBOutlet weak var keyClear: UIButton!
    @IBOutlet weak var keyNegate: UIButton!
    @IBOutlet weak var keySquareRoot: UIButton!
    @IBOutlet weak var keyDivide: UIButton!
    @IBOutlet weak var keySeven: UIButton!
    @IBOutlet weak var keyEight: UIButton!
    @IBOutlet weak var keyNine: UIButton!
    @IBOutlet weak var keyMultiply: UIButton!
    @IBOutlet weak var keyFour: UIButton!
    @IBOutlet weak var keyFive: UIButton!
    @IBOutlet weak var keySix: UIButton!
    @IBOutlet weak var keySubtract: UIButton!
    @IBOutlet weak var keyOne: UIButton!
    @IBOutlet weak var keyTwo: UIButton!
    @IBOutlet weak var keyThree: UIButton!
    @IBOutlet weak var keyAdd: UIButton!
    @IBOutlet weak var keyInfo: UIButton!
    @IBOutlet weak var keyZero: UIButton!
    @IBOutlet weak var keyDecimal: UIButton!
    @IBOutlet weak var keyTotal: UIButton!
    
    @IBOutlet weak var cursor: UIView!
    
    // Create CalcLogic() instance
    var calcLogic = CalcLogic()
    
    // Create KeypadLogic() instance
    let keyTapLogic = KeyTapLogic()
    
    // Create a mainOutputValue and set it to zero
    var mainOutputVaue: Float = 0.0
    
    // MARK: ViewController Lifecycle / View Handling

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Make the cursor blink
        cursor.blink()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Convenience
    
    
    // MARK: Actions

    @IBAction func keyTapped(_ sender: UIButton) {
        
        mainOutputLabel.text = keyTapLogic.keypadButtonTapped(sender, mainOutputIn: mainOutputLabel.text!)
        
    }
    
}

