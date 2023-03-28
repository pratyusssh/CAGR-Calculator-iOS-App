//
//  ViewController.swift
//  todo
//
//  Created by Pratyush Sanadhya on 27/03/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var cagrResult: UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    
    @IBOutlet weak var startStock: UITextField!
    
    @IBOutlet weak var endStock: UITextField!
    
    @IBOutlet weak var noYears: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set the delegate for each text field to the view controller
        startStock.delegate = self
        endStock.delegate = self
        noYears.delegate = self
    }
    
    @IBAction func calculateCAGR(_ sender: Any) {
        // Get the input values from the text fields
        guard let startPrice = Double(startStock.text ?? ""),
              let endPrice = Double(endStock.text ?? ""),
              let numYears = Double(noYears.text ?? "")
        else {
            // Handle invalid input values
            cagrResult.text = "Invalid input values"
            return
        }
        
        // Calculate the CAGR
        let cagr = (pow((endPrice/startPrice), (1/numYears)) - 1) * 100
        
        // Display the result in the label
        cagrResult.text = String(format: "CAGR: %.2f%%",cagr)
    }
    
}
extension ViewController: UITextFieldDelegate {
    
    // Dismiss the keyboard when the user taps the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Resign the first responder status of the current text field when the user is done editing it
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
}
