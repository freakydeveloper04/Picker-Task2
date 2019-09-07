//
//  SignUpVC.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxt.delegate = self
        passwordTxt.delegate = self
    }
    
    @IBAction func signupBtn(_ sender: UIButton) {
        
        guard let email = emailTxt.text else { return }
        guard let password = passwordTxt.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created!")
                
                let story = UIStoryboard(name: "Main", bundle: nil)
                let vcc = story.instantiateViewController(withIdentifier: "mains")
                vcc.modalPresentationStyle = .overCurrentContext
                self.present(vcc, animated: true, completion: nil)
            }
                
            else {
                let alert = UIAlertController(title: "Alert", message: "Error: \(error!.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
