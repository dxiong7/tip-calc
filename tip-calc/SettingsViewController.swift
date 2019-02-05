//
//  SettingsViewController.swift
//  tip-calc
//
//  Created by Daniel Xiong on 2/4/19.
//  Copyright © 2019 Daniel Xiong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var customTipField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func changeTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let customTip = Double(customTipField.text!)
        
        defaults.set(customTip, forKey: "myCustomTip")
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
