//
//  TableViewController.swift
//  Homework 5 TableView, Navigation
//
//  Created by Ravil Gubaidulin on 27.08.2022.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockService.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let user = MockService.data[indexPath.row]
        cell.setupUserName(user: user)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showVC" else { return }
        guard let viewController = segue.destination as? ViewController else { return }
        if let index  = self.tableView.indexPathForSelectedRow {
            let user = MockService.data[index.row]
            viewController.user = user
        }
    }

    @IBAction func saveCreateData(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "createUser" else { return }
        guard let source = unwindSegue.source as? EditViewController else { return }
        if let user = source.createUser {
            MockService.data.append(user)
        }
        self.tableView.reloadData()
    }

}
