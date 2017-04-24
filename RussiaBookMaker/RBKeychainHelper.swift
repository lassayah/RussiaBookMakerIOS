//
//  RBKeychainHelper.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 20/04/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import Foundation
import KeychainAccess

class RBKeychainHelper : NSObject
{
    var keychain: Keychain
    
     override init() {
        keychain = Keychain(service: "com.perso.RussiaBookMaker")
        super.init()
    }
    
    func setKeychainWithKeyAndValue(key: String, value: String)
    {
        keychain[key] = value;
    }
    
    func getStringKeychainFromKey(key: String) -> String
    {
        return keychain[key] ?? ""
    }
}
