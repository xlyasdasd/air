//
//  YMLogin.swift
//  DanTang
//
//  Created by Xuleyuan on 2017/5/26.
//  Copyright © 2017年 hrscy. All rights reserved.
//
import Foundation

class YMLogin: NSObject {
    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
}
