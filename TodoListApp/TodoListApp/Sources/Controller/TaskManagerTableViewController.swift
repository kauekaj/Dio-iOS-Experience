//
//  TaskManagerTableViewController.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 08/12/22.
//

import UIKit

class TaskManagerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

  

}
