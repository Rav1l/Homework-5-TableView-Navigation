//
//  ViewController.swift
//  Homework 5 TableView, Navigation
//
//  Created by Ravil Gubaidulin on 27.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    var user: User? = nil
    private var isShortName = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = user?.fullName
        self.jobLabel.text = self.user?.job
        self.addressLabel.text = self.user?.city
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height / 2
        self.avatarImage.image = UIImage(named: user?.avatar ?? "default")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editUser" else { return }
        guard let editVC = segue.destination as? EditViewController else { return }
        editVC.user = self.user
    }
    
    @IBAction func didTapCopyAddressButton(_ sender: Any) {
        UIPasteboard.general.string = self.user?.city
    }
    
    @IBAction func didTapChangeButton(_ sender: Any) {
        self.isShortName.toggle()
        if isShortName {
            self.nameLabel.text = self.user?.name
            self.changeButton.setTitle("Полное имя", for: .normal)
        } else {
            self.nameLabel.text = self.user?.fullName
            self.changeButton.setTitle("Имя", for: .normal)
        }
    }
    
    
    
}
