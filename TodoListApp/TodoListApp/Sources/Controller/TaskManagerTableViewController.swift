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
    @IBOutlet weak var btnRemove: UIButton!

    
    //MARK: Var/Let
    private var time: String = ""
    private var date: String = ""
    public var task: Task?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self
        self.configView()
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
        TaskDefaultHelper().deleteTaskList(task: self.task!)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func createTask(_ sender: Any) {
        createNewTask()
    }
    
    
    //MARK: - Methods
    private func configView() {
        self.btnRemove.isHidden = self.task == nil
        guard let auxTask = self.task else { return }
        self.btnTime.setTitle(auxTask.hour, for: .normal)
        self.btnTitle.text = auxTask.title
        self.date = auxTask.date
        self.time = auxTask.hour
    }
    
    private func createNewTask() {
        if self.task != nil {
            self.task!.date = self.date
            self.task!.hour = self.time
            self.task!.title = self.btnTitle.text!
            
            TaskDefaultHelper().updateTask(task: self.task!)
        } else {
            var list: [Task] = TaskDefaultHelper().getTaskList()
            let task: Task = Task(id: TaskDefaultHelper().getNextId(), title: self.btnTitle.text ?? "SEM TÍTULO", hour: self.time, date: self.date)
            
            list.append(task)
            
            TaskDefaultHelper().saveTaskList(taskList: list)
        }
        self.dismiss(animated: true)
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
        self.time = time
    }
}


extension TaskManagerTableViewController: FSCalendarDelegate, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let auxDate = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil {
            if self.date == auxDate {
                return .green
            }
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let auxDate = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil {
            if self.date == auxDate {
                return .black
            }
        }
        return nil
    }
    
}
