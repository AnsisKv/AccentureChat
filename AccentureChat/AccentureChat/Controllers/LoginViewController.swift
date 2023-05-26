//
//  LoginViewController.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 18/05/2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self!.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}

