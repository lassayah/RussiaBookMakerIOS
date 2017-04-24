//
//  RBMatch.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 20/04/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import UIKit
import ObjectMapper

class RBMatch : Mappable
{
    var matchId: NSNumber = -1
    var team1: String = ""
    var team2: String = ""
    var overtime: Bool = false
    var resultTeam1: NSNumber = -1
    var resultTeam2: NSNumber = -1
    var resultBet: String = ""
    var date: String = ""
    var group: String = ""
    
    init(matchId:NSNumber, team1:String, team2:String) {
        self.matchId = matchId
        self.team1 = team1
        self.team2 = team2
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        matchId <- map["id"]
        team1 <- map["team1"]
        team2 <- map["team2"]
        overtime <- map["prolongations"]
        resultTeam1 <- map["resultTeam1"]
        resultTeam2 <- map["resultTeam2"]
        resultBet <- map["resultBet"]
        date <- map["date"]
        group <- map["group"]
        
    }
}
