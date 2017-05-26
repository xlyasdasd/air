//
//  YMTopicViewController.swift
//  DanTang
//
//  Created by 徐乐源 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let homeCellID = "homeCellID"

class YMTopicViewController: UITableViewController, YMHomeCellDelegate {
    
    var type = Int()
    
    /// 首页列表数据
    var items = [YMMachine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        
        setupTableView()
        
        // 添加刷新控件
        refreshControl?.addTarget(self, action: #selector(loadHomeData), for: .valueChanged)
        // 获取首页数据
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHomeTopData{ (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView!.reloadData()
        }
    }
 
    func loadHomeData() {
        // 获取首页数据
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHomeTopData { (machines) in
            weakSelf!.items = machines
            weakSelf!.tableView!.reloadData()
            weakSelf!.refreshControl?.endRefreshing()
        }
    }
    
    func setupTableView() {
        tableView.rowHeight = 80
//        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, 10, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(describing: YMHomeCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: homeCellID)
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID) as! YMHomeCell
        homeCell.selectionStyle = .none
        homeCell.homeItem = items[indexPath.row]
        return homeCell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainControl = MainControl()
//        detailVC.homeItem = items[indexPath.row]
        mainControl.signId = items[indexPath.row].sign_id
        navigationController?.pushViewController(mainControl, animated: true)
    }
    
    // MARK: - YMHomeCellDelegate
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        if !UserDefaults.standard.bool(forKey: isLogin) {
            let loginVC = YMLoginViewController()
            loginVC.title = "登录"
            let nav = YMNavigationController(rootViewController: loginVC)
            present(nav, animated: true, completion: nil)
        } else {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

