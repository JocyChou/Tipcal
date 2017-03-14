//
//  SettingViewController.swift
//  Tipcal
//
//  Created by 周思雨 on 3/12/17.
//  Copyright © 2017 Siyu Zhou. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    let defaults = UserDefaults()

    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var percentageOption1: UITextField!
    @IBOutlet weak var percentageOption2: UITextField!
    @IBOutlet weak var percentageOption3: UITextField!
    @IBOutlet weak var percentageOption4: UITextField!
    
    var tipPercentages = [0.15, 0.18, 0.20, 0.22]
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        percentageOption1.tag = 1
        percentageOption2.tag = 2
        percentageOption3.tag = 3
        percentageOption4.tag = 4
        
        for i in [1, 2, 3, 4] {
            if defaults.object(forKey: "percentageOption\(i)") != nil {
                tipPercentages[i - 1] = defaults.double(forKey: "percentageOption\(i)")
            }
        }
        
        for case let view as UITextField in self.view.subviews[0].subviews{
            view.placeholder = String(Int(tipPercentages[view.tag - 1] * 100))
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingView.center.y += view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, animations: {
            self.settingView.center.y -= self.view.bounds.width
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTipPercentages(_ sender: AnyObject) {
        
        for view in self.view.subviews[0].subviews as [UIView]{
            if let perOptText = view as? UITextField {
                if perOptText.hasText {
                    defaults.set(Double(perOptText.text!)!/100, forKey: "percentageOption\(perOptText.tag)")
                }
                perOptText.placeholder = String(Int(defaults.double(forKey: "percentageOption\(perOptText.tag)") * 100))
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
