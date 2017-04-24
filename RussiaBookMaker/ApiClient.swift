//
//  ApiClient.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 04/04/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class ApiClient {
    
    
    func loginWithUsernameAndPassword(username: String, password: String, completionHandler: @escaping (Bool) -> Void)
    {
        let parameters: Parameters = ["usernameConnect": username, "passwordConnect": password]
        Alamofire.request(Constants.URL.base + Constants.URL.login, method: .post, parameters: parameters).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                print("JSON: \(json)")
                completionHandler(json["isLoggedIn"].string == "true" ? true : false)
            }
        }
    }
    
    
    func getRanking(completionHandler: @escaping ([RBUser]) -> Void)
    {
        Alamofire.request(Constants.URL.base + Constants.URL.ranking, method: .get, parameters: nil).responseArray { (response: DataResponse<[RBUser]>) in
            if let values = response.result.value {
                completionHandler(values)
            }
        }
    }
    
    func getMatchs(completionHandler: @escaping ([RBMatch]) -> Void)
    {
        let keychainHelper: RBKeychainHelper = RBKeychainHelper()
        let parameters: Parameters = ["username": keychainHelper.getStringKeychainFromKey(key: "username"), "filter": "global"]
        Alamofire.request(Constants.URL.base + Constants.URL.matchs, method: .post, parameters: parameters).responseArray { (response: DataResponse<[RBMatch]>) in
            if let values = response.result.value {
                completionHandler(values)
            }
        }
    }
    
}
