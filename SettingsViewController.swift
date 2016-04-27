//
//  SettingsViewController.swift
//  Medley
//
//  Created by Nikolas Chaconas on 4/26/16.
//  Copyright © 2016 Medley Team. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    var myRootRef = Firebase(url:"https://crackling-heat-1030.firebaseio.com/")
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var oldPasswordField: UITextField!
    @IBOutlet weak var temporaryPasswordWarning: UILabel!
    @IBOutlet weak var successMessage: UILabel!
    
    /*
 
            change these, we need to make these global somewhere
 
    */
    var blueBackground = UIColor(red: 0, green: 128/255, blue: 1, alpha: 1.0)
    var purpleBackground = UIColor(red: 204/255, green: 102/255, blue: 1, alpha: 1.0)
    
    //Color for button borders
    let buttonBorderColor : UIColor = UIColor( red: 255, green: 255, blue: 255, alpha: 0.35)
    var redColor = UIColor(red: 1, green:0, blue: 0, alpha: 0.8)
    var greenColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardOnTap()
        if(self.IsPasswordTemporary()) {
            self.ShowWarning()
        }
        else {
            self.HideWarning()
        }
        self.HideSuccess()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowSuccess() {
        self.successMessage.text = "Password Changed!"
    }
    
    func HideSuccess() {
        self.successMessage.text = ""
    }
    func ShowWarning() {
        self.temporaryPasswordWarning.text = "You are using a temporary password, it will expire in the next 24 hours. Please change your password."
    }
    
    func HideWarning() {
        self.temporaryPasswordWarning.text = ""
    }
    
    func IsPasswordTemporary() -> Bool {
        return (self.GetCurrentUser(self.myRootRef).providerData["isTemporaryPassword"] as? Bool)!
    }
    
    func ValidField(field : UITextField) -> Bool {
        let valid = field.text != "" ? true : false
        if(!valid)  {
           self.MakeTextFieldRed(field, color:self.redColor)
        }
        return valid
    }
    
    @IBAction func changePasswordPressed(sender: AnyObject) {
        
        if(self.ValidField(self.newPasswordField) && self.ValidField(self.oldPasswordField)) {
            self.myRootRef.changePasswordForUser(GetCurrentUserEmail(myRootRef), fromOld: self.oldPasswordField.text!,
                toNew: self.newPasswordField.text!, withCompletionBlock: { error in
                if error != nil {
                    
                } else {
                    self.HideWarning()
                    self.ShowSuccess()
                }
            })
        }
    }
    
}