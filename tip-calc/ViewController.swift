//
//  ViewController.swift
//  tip-calc
//
//  Created by Daniel Xiong on 1/30/19.
//  Copyright © 2019 Daniel Xiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        //print("Hello")
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //gets the bill amount, calculates tip and total
        //and updates the tip and total labels
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
}

