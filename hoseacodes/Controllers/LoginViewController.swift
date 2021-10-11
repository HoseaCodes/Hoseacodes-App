//
//  ViewController.swift
//  hoseacodes
//
//  Created by Dominique Hosea on 10/4/21.
//
import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLoginTextfield: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLoginTextfield.text = " "
    }
        
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    self.errorLoginTextfield.text = e.localizedDescription
                } else {
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
               
            }
                
        }
    }
    
    
}
