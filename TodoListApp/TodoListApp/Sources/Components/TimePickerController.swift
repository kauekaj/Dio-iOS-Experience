//
//  TimePickerController.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 12/12/22.
//

import UIKit

protocol TimePickerProtocol {
    func sendTime(time: String)
}

class TimePickerController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: Var/Let
    
    public var delegate: TimePickerProtocol?

    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func close(_ sender: UIButton) {
        if sender == self.btnOK {
            self.dismiss(animated: true) {
                guard let delegate = self.delegate else { return }
                let datePickerSelect: Date = self.datePicker.date
                let dateStr: String = Date().convertDateToString(date: datePickerSelect, dateFormatter: "HH:mm")
                delegate.sendTime(time: dateStr)
            }
        } else {
            self.dismiss(animated: true)
        }
    }
    

}
