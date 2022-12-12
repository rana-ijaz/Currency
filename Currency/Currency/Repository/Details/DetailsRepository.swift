//
//  DetailsRepository.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 12/12/2022.
//

import Foundation

class DetailsRepository: CurrencyServiceAPI {
    
    var params: [String: Any] = [:] //TODO: Create and Override the WebServiceAPI property for these new headers
    
    override var path: String! {
        let toStr = params["symbols"] as? String ?? ""
        let paramsArr = toStr.components(separatedBy: ",") //Base is on 0
        let fullPath = API.HISTORY + "start_date=2022-12-10&end_date=2022-12-12&base=\(paramsArr[0])&symbols=\(paramsArr[0]),\(paramsArr[1])"
        return fullPath
    }
    
    override var httpMethod: HttpMethod! {
        return .get
    }
    
    func getHistory(params: [String:Any], complete :@escaping (History) -> Void, failure:@escaping onFailure) {
        self.params = params
        self.network.request(self.httpRequest, success: { (response: History) in
            complete(response)
        }) { (error: NetworkError) in
            failure(error)
        }
    }
}
