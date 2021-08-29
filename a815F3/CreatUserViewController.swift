//
//  CreatUserViewController.swift
//  a815F3
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit

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
        
        
        
    }

}

extension UIViewController{
    func showMsg(msg:String){
        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

