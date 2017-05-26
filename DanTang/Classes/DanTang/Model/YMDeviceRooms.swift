//
//  File.swift
//  DanTang
//
//  Created by Xuleyuan on 2017/5/26.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation

class YMDeviceRooms: NSObject {
    var id: Int?
    var name: String?
    var roomId: String?

    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        roomId = dict["room_id"] as? String
        
    }
}
