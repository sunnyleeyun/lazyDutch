//
//  ViewController.swift
//  LazyDutch
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //result view
    @IBOutlet weak var ResultView: UIView!
    @IBOutlet weak var howMuch: UILabel!
    
    //totalamount
    @IBOutlet weak var totalAmount: UITextField!
    
    //service fee
    @IBOutlet weak var ServiceFee: UISegmentedControl!
    @IBOutlet weak var ServiceLabel: UILabel!
    
    //stepper
    @IBOutlet weak var totalPeopleStepper: UIStepper!
    @IBOutlet weak var totalPeopleLabel: UILabel!
    
    //onebyone
    @IBOutlet weak var OneByOnSwitch: UISwitch!
    @IBOutlet weak var OneByOneButton: UIButton!
    
    //fund
    @IBOutlet weak var FundSwitch: UISwitch!
    @IBOutlet weak var FundLabel: UILabel!
    
    //calculate bt
    @IBOutlet weak var Calculate: UIButton!
    
    
    //pop up
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var MyMeal: UITextField!
    @IBOutlet weak var P1Meal: UITextField!
    @IBOutlet weak var P2Meal: UITextField!
    @IBOutlet weak var P3Meal: UITextField!
    @IBOutlet weak var detailView: UIView!
    
    
    
    
    var fund = "0.0"
    
    var meMeal = "0.0"
    var person1 = "0.0"
    var person2 = "0.0"
    var person3 = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.totalAmount.delegate = self
        self.MyMeal.delegate = self
        self.P1Meal.delegate = self
        self.P2Meal.delegate = self
        self.P3Meal.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func ActionOneByOne(_ sender: Any) {
        
        if OneByOnSwitch.isOn{
            OneByOneButton.isHidden = false
        } else{
            OneByOneButton.isHidden = true
        }
        
    }
    
    @IBAction func ActionStepper(_ sender: Any) {
        totalPeopleLabel.text = "\(Int(totalPeopleStepper.value))"
    }
    
    @IBAction func Detail(_ sender: Any) {
        popUp.isHidden = false
        scrollView.isHidden = false
        detailView.isHidden = false
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
    
    
    @IBAction func PopUpDelete(_ sender: Any) {
        popUp.isHidden = true
    }
    
    
    @IBAction func PopUpConfirm(_ sender: Any) {
        popUp.isHidden = true
        
        self.meMeal = MyMeal.text!
        self.person1 = P1Meal.text!
        self.person2 = P2Meal.text!
        self.person3 = P3Meal.text!

        print(self.MyMeal)
        print(self.person1)
    
    
    }
    
    
    
    @IBAction func ActionFund(_ sender: Any) {
        if FundSwitch.isOn{
            AddFund()
        }
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
                
                let firstTextField = alertController.textFields![0] as UITextField
                self.fund = firstTextField.text!
                self.FundLabel.text = firstTextField.text
                self.FundLabel.isHidden = false
                
                
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
            var totalOnebyOne = Double(meMeal)! + Double(person1)! + Double(person2)! + Double(person3)!
            
            if Double(totalAmount.text!)! - totalOnebyOne - Double(fund)! > 0{
                
                var serviceChargeOrNot = 0.0
                
                
                switch ServiceFee.selectedSegmentIndex {
                case 0:
                    serviceChargeOrNot = 0.00
                case 1:
                    serviceChargeOrNot = 0.00
                case 2:
                    serviceChargeOrNot = 0.10
                default:
                    break
                }
                

                var result = (Double(totalAmount.text!)! - totalOnebyOne - Double(fund)!) * (1+serviceChargeOrNot)/Double(totalPeopleLabel.text!)!
                howMuch.text = String(result)
                ResultView.isHidden = false
                
            }
        }
        
    }
    
    
    
    
}

