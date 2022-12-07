//
//  HistoryCell.swift
//  ConvertCoin
//
//  Created by Kaue de Assis Jacyntho on 07/12/22.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setTitle(title:String) {
        self.lblTitle.text = title
    }
}
