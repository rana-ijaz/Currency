//
//  DetailsCell.swift
//  Currency
//
//  Created by Rana Ijaz Ahmad on 12/12/2022.
//

import UIKit

class DetailsCell: UITableViewCell {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var fromLbl: UILabel!
    @IBOutlet weak var toLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(dateVal: String, base: String, dateDictionary: [String: Double]){
        dateLbl.text = dateVal
        
        var allKeys = Array(dateDictionary.keys)
        allKeys.removeAll(where: { $0 == base })
        fromLbl.text = String(format: "%.0f", Double(dateDictionary[base] ?? 0.0))
        toLbl.text = String(format: "%.3f", Double(dateDictionary[allKeys[0]] ?? 0.0))
    }
}
