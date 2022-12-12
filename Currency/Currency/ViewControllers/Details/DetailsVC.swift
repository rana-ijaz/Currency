//
//  DetailsVC.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 09/12/2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fromLbl: UILabel!
    @IBOutlet weak var toLbl: UILabel!
    
    let detailsViewModel = DetailsViewModel()

    var history: History?
    var historyParams: [String: Any]!
    var dateArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHeaders()
        bindViewModel()
        detailsViewModel.getHistory(params: historyParams)
        tableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "DetailsCell")
    }
    
    func setHeaders(){
        fromLbl.text = historyParams["base"] as? String ?? ""
        let toStr = historyParams["symbols"] as? String ?? ""
        toLbl.text = toStr.components(separatedBy: ",")[1] //Base is on 0
    }

    //MARK: - Network Methods
    func bindViewModel(){
        detailsViewModel.bindViewModelToController = {
            DispatchQueue.main.async {
                self.history = self.detailsViewModel.history
                self.dateArr = Array(self.detailsViewModel.history.rates.keys) // Need this array to be sorted Datewise
                self.tableView.reloadData()
            }
        }
        detailsViewModel.apiError?.bind(listener: { (error) in
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
    @IBAction func backBtnClicked(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}

extension DetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        cell.setValues(dateVal: dateArr[indexPath.row], base: historyParams["base"] as! String, dateDictionary: history?.rates[dateArr[indexPath.row]] ?? [:])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
