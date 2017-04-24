//
//  ViewController.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 28/03/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import UIKit


class RBLoginController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTitle: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_sender:AnyObject)
    {
        print("click button")
        print(usernameInput.text ?? "default")
        print(passwordInput.text ?? "default password")
        let loginClient = ApiClient()
        loginClient.loginWithUsernameAndPassword(username: usernameInput.text!, password: passwordInput.text!, completionHandler: { (isLoggedIn) -> Void in
            if isLoggedIn
            {
                let keychainHelper: RBKeychainHelper = RBKeychainHelper()
                keychainHelper.setKeychainWithKeyAndValue(key: "username", value: self.usernameInput.text ?? "")
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                let alert = UIAlertController(title: NSLocalizedString("FAIL_LOGIN_TITLE", comment: "erreur"),
                                              message: NSLocalizedString("FAIL_LOGIN_MESSAGE", comment: ""),
                                              preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            
        })
        
    }


}

