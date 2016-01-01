//
//  ViewController.swift
//  TipCal
//
//  Created by Satyam Jaiswal on 12/30/15.
//  Copyright © 2015 Satyam Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var billAmountField: UITextField!
    
    @IBOutlet weak var payAmountLabel: UILabel!
    
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    
    @IBOutlet weak var tipTextLabel: UILabel!
    
    @IBOutlet weak var payTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipAmountLabel.text = "$0.00"
        payAmountLabel.text = "$0.00"
        tipAmountLabel.hidden = true
        payAmountLabel.hidden = true
        tipTextLabel.hidden = true
        payTextLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillUpdate(sender: AnyObject) {
        tipAmountLabel.hidden = false
        payAmountLabel.hidden = false
        tipTextLabel.hidden = false
        payTextLabel.hidden = false
        
        var billString = billAmountField.text!
        var tipPercent = [0.12, 0.18, 0.22]
        
        if billAmountField.text!.characters.count != 0{
            if billAmountField.text![billAmountField.text!.startIndex] != "$"
            {
                self.billAmountField.text = "$" + self.billAmountField.text!
            }
        
            billString.removeAtIndex(billString.startIndex)
        
            let bill = NSString(string: billString).doubleValue
            let tip = tipPercent[tipPercentControl.selectedSegmentIndex] * bill
            let total = bill + tip
            tipAmountLabel.text = "$\(tip)"
            payAmountLabel.text = "$\(total)"
            
            tipAmountLabel.text = String (format: "$%.2f", tip)
            payAmountLabel.text = String (format: "$%.2f", total)
        } else{
            tipAmountLabel.hidden = true
            payAmountLabel.hidden = true
            tipTextLabel.hidden = true
            payTextLabel.hidden = true
        }
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

