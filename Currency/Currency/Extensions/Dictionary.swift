//
//  Dictionary.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

extension Dictionary {
    
    var jsonString:String {
        var jsonString : String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            jsonString = String(data: jsonData, encoding: String.Encoding.utf8)! as String
        } catch {
            print(error.localizedDescription)
        }
        return jsonString
    }
    
    
    var queryString: String {
        var finalString: String = ""
        for (key,value) in self {
            finalString +=  "\(key)=\(value)&"
        }
        finalString = String(finalString.dropLast())
        if finalString == "=" {
            finalString = ""
        }
        return finalString
    }
}
