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
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    override func viewWillAppear(_ animated: Bool) {
        self.defaultTipControl.tintColor = UIColor(red: 52/255, green: 74/255, blue: 40/255, alpha: 1)
        self.view.backgroundColor = .white
        
        let defaults = UserDefaults.standard
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "myDefaultTipIndex")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        let tipPercentages = [0.1, 0.15, 0.2]
        let defaultTipIndex = defaultTipControl.selectedSegmentIndex
        
        let defaultTip = tipPercentages[defaultTipIndex]
        defaults.set(defaultTip, forKey: "myDefaultTipPercentage")
        defaults.set(defaultTipIndex, forKey: "myDefaultTipIndex")
        defaults.synchronize()
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
