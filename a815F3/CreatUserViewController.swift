//
//  CreatUserViewController.swift
//  a815F3
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import FirebaseAuth

class CreatUserViewController: UIViewController {

    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var password1TF: UITextField!
    @IBOutlet weak var password2TF: UITextField!
    

    @IBAction func createAccount(_ sender: Any) {
        let email = accountTF.text ?? ""
        let password1 = password1TF.text ?? ""
        let password2 = password2TF.text ?? ""
        
        //檢查是否為 email 格式
        
        if password1.count < 6 {
            //送出錯誤提示
            showMsg(msg: "密碼要六碼以上")
            return
        }
        
        
        if password1 != password2{
            showMsg(msg: "兩次密碼不一致")
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password1) { result, error in
            print(error)
            print(result)
            if let error = error {
                
            }else{
                let alert = UIAlertController(title: "建立成功", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)

            }
            
            
        }
        
    
        
        
    }
    
    @IBAction func secDown(_ sender: Any) {
        password1TF.isSecureTextEntry = false
        password2TF.isSecureTextEntry = false
    }
    
    @IBAction func secTouchUpInside(_ sender: Any) {
        password1TF.isSecureTextEntry = true
        password1TF.isSecureTextEntry = false
    }
}

extension UIViewController{
    func showMsg(msg:String){
        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}

