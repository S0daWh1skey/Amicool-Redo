//
//  LoginViewController.swift
//  AmiCool-Redo
//
//  Created by Albert Sphepherd on 2017/6/3.
//  Copyright © 2017年 Albert Sphepherd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var LoginBt: UIButton!

    @IBOutlet weak var UserPic: UIImageView!
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBAction func Login(_ sender: Any) {
            if self.Username.text?.characters.count == 0{
                pompAlert(message: "没有输入用户名")
            }
            else if  self.Password.text?.characters.count == 0{
                pompAlert(message: "没有输入密码")
            }
                
            else {
                let parameters = ["username":self.Username.text!,
                                  "password":self.Password.text!]
                
                //request
                
                AMNetworkMngTool.shared.AMNetwork_Login(parameters as NSDictionary , block: { (flag) in
                    if flag == "1"{
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5, execute:
                            {  self.pompAlert(message: "登录成功")
                                
                        })
                    }
                    else{
                        self.pompAlert(message: "登录不成功")
                    }
                    
                })
                
            }
        
    }
    
    
    
    func pompAlert(message:String){
        let alert = UIAlertController(title: "提示", message:  message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UserPic.image = UIImage(named: "User_Pic.png")
        self.LoginBt.layer.cornerRadius = 9.0
        //self.view.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
