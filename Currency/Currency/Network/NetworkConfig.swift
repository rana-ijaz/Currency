
//
//  NetworkConfig.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

let kCharsetUTF8Value = "application/x-www-form-urlencoded"
let kJSONValue = "application/json"
let kContentTypeHeader  = "Content-Type"
let kRequestParam = "param"

protocol EndPointType {
    var baseUrl : String! {get}
    var path : String! {get}
    var httpMethod : HttpMethod! {get}
    var httpRequest : URLRequest! {get}
    var paramters : [String : Any]! {get}
}




final class NetworkConfiguration {
    static func baseURL () -> String? {
        // Check if URL is added in plist file.
        assert(Bundle.main.infoDictionary!["BASE_URL"] != nil)
        return Bundle.main.infoDictionary?["BASE_URL"] as? String
    }
}
