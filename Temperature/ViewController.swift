//
//  ViewController.swift
//  Temperature
//
//  Created by Ben Lindsey on 7/12/14.
//  Copyright (c) 2014 Ben Lindsey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fahrenheitField: UITextField!
    @IBOutlet weak var centigradeField: UITextField!
    let numberFormatter = NSNumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        fahrenheitField.becomeFirstResponder()
    }

    @IBAction func editingDidBegin(sender: UITextField) {
        centigradeField.text = ""
        fahrenheitField.text = ""
    }

    @IBAction func editingChanged(sender: UITextField) {
        if sender == fahrenheitField {
            if let d = numberFormatter.numberFromString(fahrenheitField.text) {
                centigradeField.text = String(format: "%.1f", (Double(d) - 32) * 5 / 9);
            } else {
                centigradeField.text = ""
            }
        } else {
            if let d = numberFormatter.numberFromString(centigradeField.text) {
                fahrenheitField.text = String(format: "%.1f", Double(d) * 9 / 5 + 32);
            } else {
                fahrenheitField.text = ""
            }
        }
    }


}
