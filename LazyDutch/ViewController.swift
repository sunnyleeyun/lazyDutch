//
//  ViewController.swift
//  LazyDutch
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ResultView: UIView!
    
    @IBOutlet weak var howMuch: UILabel!
    
    @IBOutlet weak var totalAmount: UITextField!
    
    @IBOutlet weak var ServiceFee: UISegmentedControl!
    @IBOutlet weak var ServiceLabel: UILabel!
    
    @IBOutlet weak var totalPeopleStepper: UIStepper!
    @IBOutlet weak var totalPeopleLabel: UILabel!
    
    @IBOutlet weak var OneByOnSwitch: UISwitch!
    
    @IBOutlet weak var OneByOneButton: UIButton!
    
    @IBOutlet weak var FundSwitch: UISwitch!
    
    @IBOutlet weak var FundLabel: UILabel!
    
    @IBOutlet weak var Calculate: UIButton!
    
    var fund = "0"
    
    var person1 = "0.0"
    var person2 = "0.0"
    var person3 = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ActionOneByOne(_ sender: Any) {
        
        if OneByOnSwitch.isOn{
            OneByOneButton.isHidden = false
        }
        
    }
    
    @IBAction func ActionStepper(_ sender: Any) {
        totalPeopleLabel.text = "\(Int(totalPeopleStepper.value))"
    }
    
    @IBAction func Detail(_ sender: Any) {
        AddEach()
    }
    
    @IBAction func ActionSegment(_ sender: Any) {
        switch ServiceFee.selectedSegmentIndex
        {
        case 0:
            ServiceLabel.text = "No Need";
        case 1:
            ServiceLabel.text = "10% Included";
        case 2:
            ServiceLabel.text = "Add 10%";
        default:
            break; 
        }
    }
    func AddEach() {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "單點紀錄",
            message: "請輸入每人餐點金額(平分餐點不須填寫)",
            preferredStyle: .alert)
        
        
        
        // 建立N個輸入框
//        alertController.addTextField {
//            (txtEmail) -> Void in
//            txtEmail.placeholder = "<Your email here>"
//        }
        
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "My Meal $"
            self.person1 = textField.text!
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Friend 1 Meal $"
            self.person2 = textField.text!
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Friend 2 Meal $"
            self.person3 = textField.text!
        }
        /*
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Person 4"
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Person 5"
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Person 6"
        }
         */
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: UIAlertActionStyle.default) {
                (action: UIAlertAction!) -> Void in
               
                
               
        }
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
    }
    
    
    @IBAction func ActionFund(_ sender: Any) {
        
        AddFund()
    }
    
    func AddFund() {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "公共基金",
            message: "請輸入贊助金額(有人請客啦!)",
            preferredStyle: .alert)
        
        
        
        // 建立一個輸入框
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "請客總金額"
            self.fund = textField.text!
        }
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: UIAlertActionStyle.default) {
                (action: UIAlertAction!) -> Void in
                
            person1 = text
                
                
        }
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
    }
    

    
    @IBAction func Calculate(_ sender: Any) {
        if totalAmount.text != ""{
            var totalOnebyOne = Double(person1)! + Double(person2)! + Double(person3)!
            
            if Double(totalAmount.text!)! - totalOnebyOne - Double(fund)! > 0{
                var result = (Double(totalAmount.text!)! - totalOnebyOne - Double(fund)!)/Double(totalPeopleLabel.text!)!
                howMuch.text = String(result)
                ResultView.isHidden = false
            }
        }
        
    }
    
    
    
    
}

