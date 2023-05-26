//
//  SignUpViewController.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 17/05/2023.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.signUpSegue, sender: self)
                }
            }
        }
    }
}

