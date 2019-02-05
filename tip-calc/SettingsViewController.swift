//
//  SettingsViewController.swift
//  tip-calc
//
//  Created by Daniel Xiong on 2/4/19.
//  Copyright © 2019 Daniel Xiong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        print("view will disappear")
        let defaults = UserDefaults.standard
        let tipPercentages = [0.1, 0.15, 0.2]
        let defaultTipIndex = defaultTipControl.selectedSegmentIndex
        
        print("defaultTipIndex is ", defaultTipIndex)
        let defaultTip = tipPercentages[defaultTipIndex]
        defaults.set(defaultTip, forKey: "myDefaultTipPercentage")
        defaults.set(defaultTipIndex, forKey: "myDefaultTipIndex")
        defaults.synchronize()
        
    }
    @IBAction func changeTip(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
