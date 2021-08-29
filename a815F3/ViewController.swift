//
//  ViewController.swift
//  a815F3
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var message: UITextView!
    
    @IBOutlet weak var accoutnTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""

        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.message.text += "\nis SignIn name:\(user.displayName)"
            }else{
                self.message.text += "\nis SignOut"
            }
        }
    }

    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch  {
            
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        let account = accoutnTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        Auth.auth().signIn(withEmail: account, password: password) { result, error in
            
        }
        
        
    }
    
    
    
}

