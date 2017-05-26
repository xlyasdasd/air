//
//  YMMachine.swift
//  DanTang
//
//  Created by Xuleyuan on 2017/5/26.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation

class YMMachine: NSObject {
    var id: Int?
    var ip: String?
    var port: String?
    var type: String?
    var name: String?
    var sign_id: String?
    var isShare: String?
    var remoteip: String?
    var remoteport: String?
    var deviceRooms:Array<YMDeviceRooms>?

    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        ip = dict["ip"] as? String
        port = dict["port"] as? String
        type = dict["type"] as? String
        name = dict["name"] as? String
        sign_id = dict["sign_id"] as? String
        isShare = dict["isShare"] as? String
        remoteip = dict["remoteip"] as? String
        remoteport = dict["remoteport"] as? String
        deviceRooms = dict["deviceRooms"] as? Array<YMDeviceRooms>

    }
}
