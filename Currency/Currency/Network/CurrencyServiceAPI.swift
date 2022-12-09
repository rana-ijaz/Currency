//
//  CurrencyServiceAPI.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

class CurrencyServiceAPI: WebServiceApi {
    
    override var baseUrl: String! {
        
        NetworkConfiguration.baseURL()
    }
    
}
