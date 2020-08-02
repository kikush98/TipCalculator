//
//  ViewController.swift
//  TipCalculator
//
//  Created by Enrique Bercian on 7/21/20.
//  Copyright © 2020 Enrique Bercian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill
        //Calculate tip and total
        //Update labels
        let bill = Double(billField.text!) ?? 0
        var splitPeople = Double(splitField.text!) ?? 1
        if splitPeople == 0 {
            splitField.text = "1"
            splitPeople = 1
        }
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        let totalPerPerson = total / splitPeople
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }
}

