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
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNib()
    }
    
    //MARK: Action
    private func registerNib() {
        self.tableView.register(UINib(nibName: "EmptyTableCell", bundle: nil), forCellReuseIdentifier: "emptyTaskCell")
    }
    
    //MARK: Action
    @IBAction func createNewTask(_ sender: Any) {
        performSegue(withIdentifier: "createNewTaskSegue", sender: nil)
    }
    
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension ListTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskTableCell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as! TaskTableCell
//        let cell: EmptyTableCell = tableView.dequeueReusableCell(withIdentifier: "emptyTaskCell", for: indexPath) as! EmptyTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103 // 127
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Indexpath: \(indexPath.row)")
    }
}
