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
    
    //MARK: Action
    private func registerNib() {
        self.tableView.register(UINib(nibName: "EmptyTableCell", bundle: nil), forCellReuseIdentifier: "emptyTaskCell")
    }
    
    private func loadItens() {
        self.list = TaskDefaultHelper().getTaskList()
        self.tableView.reloadData()
    }
    
    //MARK: Action
    @IBAction func createNewTask(_ sender: Any) {
        performSegue(withIdentifier: "createNewTaskSegue", sender: nil)
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
            
        } else {
            self.performSegue(withIdentifier: "createNewTaskSegue", sender: nil)
            
        }
        
    }
}
