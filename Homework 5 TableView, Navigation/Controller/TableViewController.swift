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
    //Переход на ViewController с передачей туда данных
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showVC" else { return }
        guard let viewController = segue.destination as? ViewController else { return }
        if let index  = self.tableView.indexPathForSelectedRow {
            let user = MockService.data[index.row]
            viewController.user = user
        }
    }
    //Создание пользовотелия в MockService и ячейки в TableViewController или изменине данных пользователя в MockService и в ячейке в TableViewController
    @IBAction func saveData(_ unwindSegue: UIStoryboardSegue) {
        switch unwindSegue.identifier {
        case "createUser":
            guard let source = unwindSegue.source as? EditViewController else { return }
            guard let user = source.createUser else { return }
            MockService.data.append(user)
            self.tableView.reloadData()
        case "updateUser":
            guard let source = unwindSegue.source as? EditViewController else { return }
            guard let user = source.user else { return }
            guard let index = self.tableView.indexPathForSelectedRow else { return }
            MockService.data[index.row] = user
            self.tableView.reloadData()
        default: break
        }
    }
}
