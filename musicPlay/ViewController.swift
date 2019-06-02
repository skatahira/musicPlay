//
//  ViewController.swift
//  musicPlay
//
//  Created by 片平駿介 on 2019/05/28.
//  Copyright © 2019 ShunsukeKatahira. All rights reserved.
//

import UIKit
import SmileLock
import Foundation

class ViewController: UIViewController, PasswordInputCompleteProtocol {
    @IBOutlet weak var messageText: UILabel!
    
    let passwordDigit = 6
    var mode: DisplayMode!
    var passwordContainerView: PasswordContainerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordContainerView = PasswordContainerView.create(withDigit: passwordDigit)
        passwordContainerView.center = self.view.center
        passwordContainerView.delegate = self
        
        if mode == DisplayMode.confirm {
//            messageText.text = "設定するパスワードを入力してください"
        } else if mode == DisplayMode.register {
//            messageText.text = "確認のためもう一度パスワードを入力してください"
        } else {
//            messageText.text = "パスワードを入力してください"
        }
        
        
        self.view.addSubview(passwordContainerView)

    }
    
    // パスワード手入力
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        
        //passwordContainerView.wrongPassword()
        toNext()
        //self.performSegue(withIdentifier: "toNext", sender: nil)
    }
    
    // touchID
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            toNext()
        } else {
            passwordContainerView.wrongPassword()
        }
    }
    
    enum DisplayMode {
        case confirm, register, lock
    }
    
    @IBAction func toNext() {
        performSegue(withIdentifier: "toNext", sender: nil)
    }


}

