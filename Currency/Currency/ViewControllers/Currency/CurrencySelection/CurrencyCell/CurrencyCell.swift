//
//  CurrencyCell.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 12/12/2022.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var currencyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(currency: String){
        currencyLbl.text = currency
    }
    
}
