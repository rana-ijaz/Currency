//
//  CurrencyVC.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import UIKit

class CurrencyVC: UIViewController {

    let currencyViewModel = CurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        currencyViewModel.getCurrency()
    }
    
    //MARK: - Network Methods
    func bindViewModel(){
        currencyViewModel.bindViewModelToController = {
            print("Binding Success")
            DispatchQueue.main.async {
                
            }
        }
        currencyViewModel.apiError?.bind(listener: { (error) in
            print(error)
            DispatchQueue.main.async {
                if let errorMsg = error.errorMessage {
                    print(errorMsg)
                    //self.showInfoAlert(message: errorMsg)
                }
            }
        })
    }
    
    //MARK: - IBAction Methods
    @IBAction func detailBtnClicked(_ sender: UIButton){
        
    }

}
