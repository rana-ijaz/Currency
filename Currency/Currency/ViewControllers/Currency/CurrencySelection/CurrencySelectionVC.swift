//
//  CurrencySelectionVC.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 12/12/2022.
//

import UIKit

protocol CurrencySelectionProtocol: AnyObject {
    func selectedCurrency(currency: String)
}

class CurrencySelectionVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: CurrencySelectionProtocol? = nil

    var currentCurrency = ""
    var currenciesArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CurrencyCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
    }

    //MARK: - IBACtion methods
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }

}

extension CurrencySelectionVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        cell.setValues(currency: currenciesArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCurrency(currency: currenciesArr[indexPath.row])
        self.dismiss(animated: true)
    }
    
}
