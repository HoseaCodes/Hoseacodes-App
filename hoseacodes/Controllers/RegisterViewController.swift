//
//  ViewController.swift
//  hoseacodes
//
//  Created by Dominique Hosea on 10/4/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var errorTextfield: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorTextfield.text = " "
    }
        
    @IBAction func registerPressed(_ sender: UIButton) {
        
            if let email = emailTextfield.text, let password = passwordTextfield.text {
                
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    self.errorTextfield.text = e.localizedDescription
                } else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
}
