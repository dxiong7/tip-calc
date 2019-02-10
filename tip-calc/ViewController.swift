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
    
    var customTipPercentage = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myDefaultTipIndex")
        let lastTimeDiff = Date(timeIntervalSinceNow: TimeInterval(10))
        print("it has been ", lastTimeDiff, "minutes")
        
        if (Date() < lastTimeDiff) {
            print("remembering last bill amount and setting")
            billField.text = defaults.string(forKey: "BillAmountString")
            
            let bill = Double(billField.text!) ?? 0
            let tipPercentages = [0.1, 0.15, 0.2]
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
            //save bill amount in user Defaults
            defaults.set(bill, forKey: "BillAmount")
            defaults.synchronize()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.billField.textColor = UIColor(red: 52/255, green: 74/255, blue: 40/255, alpha: 1)
        self.view.backgroundColor = .white
        self.tipControl.tintColor = UIColor(red: 52/255, green: 74/255, blue: 40/255, alpha: 1)
        self.tipLabel.textColor = UIColor(red: 52/255, green: 74/255, blue: 40/255, alpha: 1)
        self.totalLabel.textColor = UIColor(red: 52/255, green: 74/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 52/255, green: 74/255, blue: 40/255, alpha: 1)

        let defaults = UserDefaults.standard
        let bill = Double(billField.text!) ?? 0
        
        let tip = defaults.double(forKey: "myDefaultTipPercentage") * bill
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myDefaultTipIndex")
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        billField.becomeFirstResponder()
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    @IBAction func onTap(_ sender: Any) {
        //print("Hello")
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //gets the bill amount, calculates tip and total
        //and updates the tip and total labels
        let defaults = UserDefaults.standard
        
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //save bill amount in user Defaults
        defaults.set(billField.text, forKey: "BillAmountString")
        defaults.set(bill, forKey: "BillAmount")
        defaults.synchronize()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        
        let bill = Double(billField.text!) ?? 0
        defaults.set(billField.text, forKey: "BillAmountString")
        defaults.set(bill, forKey: "BillAmount")
        defaults.synchronize()
        
        //print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did disappear")
    }
}

