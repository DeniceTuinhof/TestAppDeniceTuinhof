//
//  ViewController.swift
//  Tweedepoging
//
//  Created by D J Tuinhof on 26-10-15.
//  Copyright © 2015 D J Tuinhof. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var result = Float ()
    var currentNumber = Float()
    
    var currentOp = String ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentOp = "="
        lblResult.text = ("\(result)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnNumberInput(sender: UIButton) {
        currentNumber = currentNumber * 10 + Float(sender.titleLabel!.text!)!
        lblResult.text = ("\(currentNumber)")
    }
    
    func textFieldShouldReturn(nameTextField: UITextField) -> Bool {
        nameLabel.textColor = UIColor.redColor()
        nameLabel.text = "Hello \(nameTextField.text!)"
        return true
    }

    @IBAction func btnOperation(sender: UIButton) {
        switch currentOp {
            case "=":
                result = currentNumber
            case "+":
                result = result + currentNumber
            case "-":
                result = result - currentNumber
            case "*":
                result = result * currentNumber
            case "/":
                result = result / currentNumber
            default:
                print("error")
        }
        currentNumber = 0
        lblResult.text = ("\(result)")
        
        if(sender.titleLabel!.text == "=") {
            result = 0
        }
        currentOp = sender.titleLabel!.text! as String!
    }
    
    @IBAction func btnClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOp = "="
        lblResult.text = ("\(result)")

    }
    
}

