//
//  User.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 30/03/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import UIKit
import ObjectMapper

class RBUser: Mappable {
    
    var username: String = ""
    var isLoggedIn: Bool = false
    var points = ""
    var rank = "0"
    
    init(username:String, points:String, rank:String) {
        self.username = username
        self.points = points
        self.rank = rank
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        username <- map["user"]
        isLoggedIn <- map["isLoggedIn"]
        points <- map["points"]
        rank <- map["rank"]
        
    }


}
