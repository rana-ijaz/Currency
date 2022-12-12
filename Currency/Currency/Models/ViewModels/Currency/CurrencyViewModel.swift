//
//  CurrencyViewModel.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

class CurrencyViewModel{
    
    var currencySelected: CurrencySelected?
    
    var currency: Currency!{
        didSet{
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    var currencyRepository: CurrencyRepository
    
    var apiError:Box<NetworkError>? = Box(NetworkError())
    
    init(repo : CurrencyRepository = CurrencyRepository()) {
        currencyRepository = CurrencyRepository()
    }
    
    func getCurrency() {
        self.currencyRepository.getCurrency(complete: {[weak self] (response) in
            self?.currency = response
        }) { (networkError) in
            if let error = networkError {
                self.apiError?.value = error
            }
        }
    }
    
    func convert(from: String, to: String) { // Making this conversion function to avoid frequent API calls
        
        let baseValue = currency.rates[currency.base] ?? 0.0
        let fromValue = 1.0 //(currency.rates[from] ?? 0.0 / (currency.rates[from] ?? 0.0) )
        
        let toValue = ((currency.rates[to] ?? 0.0) * (baseValue / (currency.rates[from] ?? 0.0))) //Formula to convert from and to currency based on the base currency
        currencySelected = CurrencySelected(fromCurrency: from, toCurrency: to, fromValue: fromValue , toValue: toValue )
    }
}
