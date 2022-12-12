//
//  TaskManagerTableViewController.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 08/12/22.
//

import UIKit
import FSCalendar

class TaskManagerTableViewController: UITableViewController {

    @IBOutlet weak var btnTitle: UITextField!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var btnTime: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TimePickerController {
            controller.delegate = self
        }
    }
    
    
    //MARK: - IBAction
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func openComponent(_ sender: Any) {
        self.performSegue(withIdentifier: "segueComponentTime", sender: nil)
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        
    }
    
    
    @IBAction func createTask(_ sender: Any) {
        
    }

}

extension TaskManagerTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension TaskManagerTableViewController: TimePickerProtocol {
    func sendTime(time: String) {
        self.btnTime.setTitle(time, for: .normal)
    }
}


extension TaskManagerTableViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(Date().convertdateToString(date: date, dateFormatter: "dd/MM/yyyy"))
    }
}
