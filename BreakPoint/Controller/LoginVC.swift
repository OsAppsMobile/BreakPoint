//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 22.08.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: InsetTextField!
    @IBOutlet weak var passwordTxt: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailTxt.text != "" && passwordTxt.text != "" {
            AuthService.instance.loginUser(withEmail: emailTxt.text!, andPassword: passwordTxt.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
            
                AuthService.instance.registerUser(withEmail: self.emailTxt.text!, andPassword: self.passwordTxt.text!, userCreationComplete: { (success, registerError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTxt.text!, andPassword: self.passwordTxt.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                        })
                    } else {
                        print(String(describing: registerError?.localizedDescription))
                    }
                })
            
            })
            
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
