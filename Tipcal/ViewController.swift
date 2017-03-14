//
//  ViewController.swift
//  Tipcal
//
//  Created by 周思雨 on 3/12/17.
//  Copyright © 2017 Siyu Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    var tipPer: Double = 0
    let defaults = UserDefaults()
    var tipPercentages = [0.15, 0.18, 0.20, 0.22]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        billView.center.y -= view.bounds.width
        tipView.center.y += view.bounds.width
        
        for i in [1, 2, 3, 4] {
            if defaults.object(forKey: "percentageOption\(i)") != nil{
                tipPercentages[i - 1] = defaults.double(forKey: "percentageOption\(i)")
            }
            tipControl.setTitle("\(Int(tipPercentages[i - 1] * 100))%", forSegmentAt: i - 1)
        }
        billField.placeholder = "$"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, animations: {
            self.billView.center.y += self.view.bounds.width
            self.tipView.center.y -= self.view.bounds.width
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        if (!(tipControl.selectedSegmentIndex == UISegmentedControlNoSegment)){
            tipPer = tipPercentages[tipControl.selectedSegmentIndex]
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPer
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

