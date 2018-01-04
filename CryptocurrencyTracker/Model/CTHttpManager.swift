//
//  VTHttpManager.swift
//  CryptocurrencyTracker
//
//  Created by oatThanut on 2/1/2561 BE.
//  Copyright © 2561 WTFart. All rights reserved.
//

import Foundation
import Alamofire

class CTHttpManager {
    static let shareInstance = CTHttpManager();
    let BASE_URL = "https://api.coinmarketcap.com/v1/ticker/"
    
    func retrieveTopHundred( successBlock:@escaping (_ data: JSONSerialization) -> Void, errorBlock:@escaping () -> Void) {
        Alamofire.request("\(BASE_URL)", method: .get).reaponseJSON { response in
            if response.result.isSuccess {
                let list = response.result.value as! Dictionary<String, Any>
                successBlock(list)
            } else {
                errorBlock()
            }
        }
    }
}
