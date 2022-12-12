//
//  DetailsViewModel.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 12/12/2022.
//

import Foundation

class DetailsViewModel{
    
    var history: History!{
        didSet{
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    var detailsRepository: DetailsRepository
    
    var apiError:Box<NetworkError>? = Box(NetworkError())
    
    init(repo : DetailsRepository = DetailsRepository()) {
        detailsRepository = DetailsRepository()
    }
    
    func getHistory(params: [String:Any]) {
        self.detailsRepository.getHistory(params: params, complete: {[weak self] (response) in
            self?.history = response
        }) { (networkError) in
            if let error = networkError {
                self.apiError?.value = error
            }
        }
    }
}
