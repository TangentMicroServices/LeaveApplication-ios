//
//  LeaveFormViewController.swift
//  LeaveApplication
//
//  Created by Ruaan Erasmus on 2016/04/16.
//  Copyright © 2016 Tangent Solutions. All rights reserved.
//

import UIKit
import SwiftyJSON

class LeaveFormViewController: UIViewController {

    let api: LeaveServiceAPI = LeaveServiceAPI()
    
    @IBOutlet weak var leaveTypeTxt: UITextField!
    @IBOutlet weak var startDateTxt: UITextField!
    @IBOutlet weak var endDateTxt: UITextField!
    
    @IBAction func CloseButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        startDateTxt.text = dateFormatter.stringFromDate(sender.date)
        
    }

    
    @IBAction func initFromDatePicker(sender: UITextField) {
    
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(LeaveFormViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    
    }
    
    
    @IBAction func submitLeaveApplication(sender: AnyObject) {
    
        let leaveType = leaveTypeTxt.text
        let startDate = startDateTxt.text
        let endDate = endDateTxt.text
        
        api.createLeaveAplication(leaveType!, startDate: startDate!, endDate: endDate!, callback: {(status: String?, data: JSON?) -> () in
        
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
