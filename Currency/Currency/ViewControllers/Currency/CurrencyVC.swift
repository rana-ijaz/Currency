//
//  CurrencyVC.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import UIKit

class CurrencyVC: UIViewController {
    
    @IBOutlet weak var fromBtn: UIButton!
    @IBOutlet weak var toBtn: UIButton!
    @IBOutlet weak var fromTxt: UITextField!
    @IBOutlet weak var toTxt: UITextField!

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
                self.setupDefaultValues()
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
    
    func setupDefaultValues(){
        let allCurrencies = Array(currencyViewModel.currency.rates.keys)
        let sorted = allCurrencies.sorted()
        
        currencyViewModel.convert(from: sorted[0], to: sorted[1])
        setValues()
    }
    
    func setValues(){
        fromBtn.setTitle(currencyViewModel.currencySelected?.fromCurrency, for: .normal)
        toBtn.setTitle(currencyViewModel.currencySelected?.toCurrency, for: .normal)
        fromTxt.text = String(format: "%.3f", currencyViewModel.currencySelected?.fromValue ?? 0.0)
        toTxt.text = String(format: "%.3f", currencyViewModel.currencySelected?.toValue ?? 0.0)
    }
    
    //MARK: - IBAction Methods
    @IBAction func interchangeBtnClicked(_ sender: UIButton){
        currencyViewModel.convert(from: toBtn.titleLabel?.text ?? "", to: fromBtn.titleLabel?.text ?? "")
        setValues()
    }
    
    @IBAction func detailBtnClicked(_ sender: UIButton){
        
    }

}


extension CurrencyVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            let newVal = (currencyViewModel.currencySelected?.toValue ?? 0.0) * (Double(fromTxt.text ?? "0.0") ?? 0.0)
            toTxt.text = String(format: "%.3f", newVal)
        }
        else if textField.tag == 2 {
            let newVal = (Double(toTxt.text ?? "0.0") ?? 0.0) / (currencyViewModel.currencySelected?.toValue ?? 0.0)
            fromTxt.text = String(format: "%.3f", newVal)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder();
        return true;
    }
}
