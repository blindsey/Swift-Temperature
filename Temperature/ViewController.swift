//
//  ViewController.swift
//  Temperature
//
//  Created by Ben Lindsey on 7/12/14.
//  Copyright (c) 2014 Ben Lindsey. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var fahrenheitField: UITextField
    @IBOutlet var centigradeField: UITextField
    let numberFormatter = NSNumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        fahrenheitField.becomeFirstResponder()
    }

    @IBAction func onMailTap(sender: UIBarButtonItem) {
        var controller = MFMailComposeViewController();
        controller.setSubject("Test Subject")
        controller.setToRecipients([ "michaelellison@gmail.com" ])
        controller.setMessageBody("HI", isHTML: false)
        controller.mailComposeDelegate = self
        presentViewController(controller, animated: true) {}
    }

    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError) {
        dismissViewControllerAnimated(true, completion: nil)
        if result.value == MFMailComposeResultSent.value {
            UIAlertView(title: "Mail Sent", message: nil, delegate: nil, cancelButtonTitle: "OK").show()
        }
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
