//
//  NetworkRequest.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

typealias ResultSuccess<T> = (T) -> Void
typealias ResultFailure = (NetworkError)  -> Void

protocol NetworkRequest {
    
    func request<T: Decodable>(_ request : URLRequest, success : @escaping ResultSuccess<T>,failure : @escaping ResultFailure)
    
}
