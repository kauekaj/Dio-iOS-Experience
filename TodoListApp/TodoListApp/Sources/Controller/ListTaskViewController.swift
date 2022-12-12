//
//  ListTaskViewController.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 08/12/22.
//

import UIKit

class ListTaskViewController: UIViewController {
    
    
    //MARK: IBOutlet
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Var/Let
    private var list: [Task] = []
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.registerNib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadItens()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TaskManagerTableViewController {
            guard let task = sender as? Task else { return }
            controller.task = task
        }
    }
    
    //MARK: Action
    private func registerNib() {
        self.tableView.register(UINib(nibName: "EmptyTableCell", bundle: nil), forCellReuseIdentifier: "emptyTaskCell")
    }
    
    private func loadItens() {
        self.list = TaskDefaultHelper().getTaskList()
        self.tableView.reloadData()
    }
    
    private func callCreatetask(task: Task?) {
        self.performSegue(withIdentifier: "createNewTaskSegue", sender: task)

    }
    
    //MARK: Action
    @IBAction func createNewTask(_ sender: Any) {
        self.callCreatetask(task: nil)
    }
    
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension ListTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count > 0 ? self.list.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.list.count > 0 {
            let cell: TaskTableCell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as! TaskTableCell
            let task: Task = self.list[indexPath.row]
            cell.setupCell(titleLabel: task.title, hourLabel: task.hour, dataLabel: task.date)
            return cell
        } else {
            let cell: EmptyTableCell = tableView.dequeueReusableCell(withIdentifier: "emptyTaskCell", for: indexPath) as! EmptyTableCell
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.list.count > 0 ? 103 : 127
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.list.count > 0 {
            self.callCreatetask(task: self.list[indexPath.row])

        } else {
            self.callCreatetask(task: nil)

        }
    }
}
