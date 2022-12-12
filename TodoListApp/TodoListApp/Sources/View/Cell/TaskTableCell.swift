//
//  TaskTableCell.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 08/12/22.
//

import UIKit

class TaskTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    public func setupCell(titleLabel: String, hourLabel:String, dataLabel: String) {
        self.titleLabel.text = titleLabel
        self.hourLabel.text = hourLabel
        self.dateLabel.text = dataLabel
    }
}
