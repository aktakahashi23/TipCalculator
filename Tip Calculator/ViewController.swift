//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Amanda Takahashi on 7/25/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var splitNumberTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageAmount: UILabel!
    @IBOutlet weak var maxTipPercentage: UILabel!
    @IBOutlet weak var middleTipPercentage: UILabel!
    
    let settings = SettingsViewController()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        //Numberpad
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        splitNumberTextField.keyboardType = UIKeyboardType.decimalPad
    }
 
    
    @IBAction func slider(_ sender: UISlider) {
        let tipAmount = Int(sender.value)
        
        //let maxTipPercentageAmount:Float? = Float(settings.MaxTipAmount.text!) ?? 0
       // let maxTipPercentageAmount = settings.MaxTipAmount.text
 
        
        tipPercentageSlider.maximumValue = 30.0
       
        //tipPercentageSlider.maximumValue = (maxTipPercentageAmount)

        tipPercentageAmount.text = "\(tipAmount)" //+ "%"
        
        //maxTipPercentage.text = String(format: "%2f%", maxTipPercentageAmount!)
        
        maxTipPercentage.text = String(format: "%.0f", tipPercentageSlider.maximumValue, "%")
        
        middleTipPercentage.text = String(format: "%.0f", tipPercentageSlider.maximumValue / 2, "%")
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get initial bill amount and calculate tips

        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentage = (Double(tipPercentageAmount.text!) ?? 0) / 100.00
        let people = Double(splitNumberTextField.text!) ?? 0
        
        //calculate tip and total
        let tip = bill * tipPercentage
        let total = (bill + tip) / people

        //Update the tip and total labels
        totalAmountLabel.text = String(format: "$%.2f", total)
        //tipPercentageAmount.text = String(format: "$%.2f", tipPercentages)
    }
    
    //Settings --> Main Scene
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        
        defaults.set(30, forKey: "maxTipPercentageAmount")
        
        defaults.synchronize()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

}
