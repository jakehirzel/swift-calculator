//
//  ViewController.swift
//  Crnch
//
//  Created by Jake Hirzel on 11/11/17.
//  Copyright © 2017 Jake Hirzel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var mainOutputLabel: UILabel!
    
    @IBOutlet weak var tapeTable: UITableView!
    
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
        
    // Create KeyTapLogic() instance
    var keyTapLogic = KeyTapLogic()
    
    // Create empty OperationLog instance and populate with blank Operation
    var operationLog = OperationLog(operationLog: [Operation(number: "", operation: .addition, mainOutput: "")])
    
    // MARK: ViewController Lifecycle / View Handling

    override func viewDidLoad() {
        super.viewDidLoad()

        tapeTable.delegate = self
        tapeTable.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Make the cursor blink
        cursor.blink()
        
        // Reset the mainOutputLabel
        // TODO: Does this need to reset to runningTotal if it exists?
        mainOutputLabel.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
//        return operationLog.operationLog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tapeCell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = operationLog.operationLog[row].mainOutput
        cell.detailTextLabel?.text = operationLog.operationLog[row].operation.rawValue
        return cell
    }
    
    // MARK: Convenience
    
    
    // MARK: Actions

    @IBAction func keyTapped(_ sender: UIButton) {
        
        // Clear mainOutputLabel on number tap if previous action exists and was an operation
        if let lastOperation = operationLog.operationLog.last?.operation {
            switch lastOperation {
            case .addition, .subtraction, .multiplication, .division, .negation, .squareRoot:
                mainOutputLabel.text = ""
            default:
                break
            }
        }
        
        // Run keypadButtonTapped and save output
        operationLog = keyTapLogic.keypadButtonTapped(sender, mainOutputIn: mainOutputLabel.text!, operationLogIn: operationLog)
        
        // Assign text to mainOutputLabel
        mainOutputLabel.text = operationLog.operationLog.last?.mainOutput
        
        // Update tapeTable
        self.tapeTable.reloadData()
        
    }
    
}

