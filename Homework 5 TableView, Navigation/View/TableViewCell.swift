//
//  TableViewCell.swift
//  Homework 5 TableView, Navigation
//
//  Created by Ravil Gubaidulin on 27.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupUserName(user: User) {
        self.nameLable?.text = user.name + " " + user.surname
    }

    

}
