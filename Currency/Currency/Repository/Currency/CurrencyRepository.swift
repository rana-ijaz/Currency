//
//  CurrencyRepository.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

class CurrencyRepository: CurrencyServiceAPI {
    
    override var path: String! {
        return API.CURRENCIES
    }
    
    override var httpMethod: HttpMethod! {
        return .get
    }
    
    func getCurrency(complete :@escaping (Currency) -> Void, failure:@escaping onFailure) {
        
        self.network.request(self.httpRequest, success: { (response: Currency) in
            complete(response)
        }) { (error: NetworkError) in
            failure(error)
        }
    }
}
