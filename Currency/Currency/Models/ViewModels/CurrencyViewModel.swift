//
//  CurrencyViewModel.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import Foundation

class CurrencyViewModel{
    
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
}
