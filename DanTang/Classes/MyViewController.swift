//
//  YMLoginViewController.swift
//  DanTang
//
//  Created by 徐乐源 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class MyViewContorller: YMBaseViewController {
    /// 手机号
    @IBOutlet weak var temp: UITextField!
    
    @IBOutlet weak var add: UIButton!
    
    @IBOutlet weak var min: UIButton!
    
    var signId:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏的左右按钮
        connect()
        setupBarButtonItem()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        if(animated){
            diconnect()
        }
    }
    func diconnect(){
        YMNetworkTool.shareNetworkTool.disconnect {
            
        } ;
        
    }
    func connect(){
        YMNetworkTool.shareNetworkTool.connect(signId: signId!) {
            
        } ;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(cancelButtonClick))
        
//        add.addTarget(self, action: #selector(addTemper), for: .touchUpInside)
//        
//        min.addTarget(self, action: #selector(lessTemper), for: .touchUpInside)
    }
    
    func addTemper(){
        YMNetworkTool.shareNetworkTool.add {
        }
        
    }
    func lessTemper(){
        YMNetworkTool.shareNetworkTool.less {
        };
        
        
    }
    /// 取消按钮点击
    func cancelButtonClick() {
        dismiss(animated: true, completion: nil)
    }    
}
