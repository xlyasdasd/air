//
//  YMLoginViewController.swift
//  DanTang
//
//  Created by 徐乐源 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMLoginViewController: YMBaseViewController {
    /// 手机号
    @IBOutlet weak var mobileField: UITextField!
    /// 密码
    @IBOutlet weak var passwordField: UITextField!
    /// 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    /// 忘记密码按钮
    @IBOutlet weak var forgetPwdBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏的左右按钮
        setupBarButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func loginButtonClick(sender: UIButton) {
        let username = mobileField.text
        let password = passwordField.text
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.login(username: username!, password: password!) { (results) in
            //            weakSelf!.results = results
            //            weakSelf!.collectionView!.reloadData()
            UserDefaults.standard.set(true, forKey: isLogin)
            weakSelf?.dismiss(animated: true, completion: nil)
        }
        
        
        
        
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(regiisterButtonClick))
        loginButton.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        
        
    }
    
    /// 取消按钮点击
    func cancelButtonClick() {
        dismiss(animated: true, completion: nil)
    }
    /// 注册按钮点击
    func regiisterButtonClick() {
        let registerVC = YMRegisterViewController()
        registerVC.title = "注册"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @IBAction func otherLoginButtonClick(sender: UIButton) {
        if let buttonType = YMOtherLoginButtonType(rawValue: sender.tag) {
            switch buttonType {
            case .weiboLogin:
                
                break
            case .weChatLogin:
                
                break
            case .QQLogin:
                
                break
            }
        }
    }

}
