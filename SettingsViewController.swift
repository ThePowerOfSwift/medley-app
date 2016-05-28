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
    @IBOutlet weak var accountSettingsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var settingsHeader: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    

    

    /*

    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var oldPasswordField: UITextField!
    @IBOutlet weak var temporaryPasswordWarning: UILabel!
    @IBOutlet weak var successMessage: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    */
    
    /*
 
            change these, we need to make these global somewhere
 
    */
    var blueBackground = UIColor(red: 0, green: 128/255, blue: 1, alpha: 1.0)
    var purpleBackground = UIColor(red: 204/255, green: 102/255, blue: 1, alpha: 1.0)
    
    //Color for button borders
    let buttonBorderColor : UIColor = UIColor( red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 0.35)
    let buttonShadowColor : UIColor = UIColor( red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1.0)
    var redColor = UIColor(red: 1, green:0, blue: 0, alpha: 0.8)
    var greenColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardOnTap()
        
        //Put shadow on settings header
        self.settingsHeader.layer.shadowColor = buttonShadowColor.CGColor
        self.settingsHeader.layer.shadowOffset = CGSizeMake(0, 6)
        self.settingsHeader.layer.shadowRadius = 3.0
        self.settingsHeader.layer.shadowOpacity = 1.0
        
        //Round button edges
        self.aboutButton.layer.borderWidth = 1
        self.aboutButton.layer.borderColor = self.buttonBorderColor.CGColor
        self.aboutButton.layer.cornerRadius = 5
        self.accountSettingsButton.layer.borderWidth = 1
        self.accountSettingsButton.layer.borderColor = self.buttonBorderColor.CGColor
        self.accountSettingsButton.layer.cornerRadius = 5
        self.logoutButton.layer.borderWidth = 1
        self.logoutButton.layer.borderColor = self.buttonBorderColor.CGColor
        self.logoutButton.layer.cornerRadius = 5
        self.supportButton.layer.borderWidth = 1
        self.supportButton.layer.borderColor = self.buttonBorderColor.CGColor
        self.supportButton.layer.cornerRadius = 5
        
        //Give buttons shadows
        self.aboutButton.layer.shadowColor = self.buttonShadowColor.CGColor
        self.aboutButton.layer.shadowOpacity = 1.0
        self.aboutButton.layer.shadowRadius = 1.0
        self.aboutButton.layer.shadowOffset = CGSizeMake(0, 3)
        self.accountSettingsButton.layer.shadowColor = self.buttonShadowColor.CGColor
        self.accountSettingsButton.layer.shadowOpacity = 1.0
        self.accountSettingsButton.layer.shadowRadius = 1.0
        self.accountSettingsButton.layer.shadowOffset = CGSizeMake(0, 3)
        self.logoutButton.layer.shadowColor = self.buttonShadowColor.CGColor
        self.logoutButton.layer.shadowOpacity = 1.0
        self.logoutButton.layer.shadowRadius = 1.0
        self.logoutButton.layer.shadowOffset = CGSizeMake(0, 3)
        self.supportButton.layer.shadowColor = self.buttonShadowColor.CGColor
        self.supportButton.layer.shadowOpacity = 1.0
        self.supportButton.layer.shadowRadius = 1.0
        self.supportButton.layer.shadowOffset = CGSizeMake(0, 3)
        
        
        /*
        if(self.IsPasswordTemporary()) {
            self.ShowWarning()
        }
        else {
            self.HideWarning()
        }
        self.HideSuccess()
        loadingIndicator.alpha = 0;
        */
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        myRootRef.unauth()
        self.performSegueWithIdentifier("ViewController", sender:sender)
    }
    
    /*
    @IBAction func showAboutPopup(sender: AnyObject) {
        let alertController = UIAlertController(title: "About Medley", message:
            "Medley is an app where you can join rooms with friends to listen to music and chat. \n\nMedley was first created by five students at the University of California, Santa Barbara in Spring 2016. \n\nWe hope you enjoy using our app!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
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
    
    func ShowLoading() {
        loadingIndicator.alpha = 1.0
        loadingIndicator.startAnimating()
    }
    
    func HideLoading() {
        loadingIndicator.alpha = 0.0
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
            ShowLoading()
            self.myRootRef.changePasswordForUser(GetCurrentUserEmail(myRootRef), fromOld: self.oldPasswordField.text!,
                toNew: self.newPasswordField.text!, withCompletionBlock: { error in
                if error != nil {
                    self.HideLoading()
                } else {
                    self.HideLoading()
                    self.HideWarning()
                    self.ShowSuccess()
                }
            })
        }
    }
    */
    
    
 }