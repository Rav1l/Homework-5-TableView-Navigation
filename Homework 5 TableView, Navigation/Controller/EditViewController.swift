//
//  EditViewController.swift
//  Homework 5 TableView, Navigation
//
//  Created by Ravil Gubaidulin on 28.08.2022.
//

import UIKit

class EditViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var editAvatarImage: UIImageView!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var patronymicTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var user: User? = nil
    var createUser: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editAvatarImage.layer.cornerRadius = self.editAvatarImage.frame.height / 2
        guard let user = user else { return }
        self.nameTextField.text = user.name
        self.surnameTextField.text = user.surname
        self.patronymicTextField.text = user.patronymic
        self.jobTextField.text = user.job
        self.addressTextField.text = user.city
        self.editAvatarImage.image = UIImage(named: user.avatar)
    }
    
   
    @IBAction func didTapGoBackCancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSave(_ sender: Any) {
        if user == nil {
            createUser = User(name: self.nameTextField.text ?? " " ,
                              surname: self.surnameTextField.text ?? " ",
                              patronymic: self.patronymicTextField.text ?? " ",
                              job: self.jobTextField.text ?? " ",
                              city: self.addressTextField.text ?? " ",
                              avatar: "default")
            performSegue(withIdentifier: "createUser", sender: self)
        } else {
            
        }
        
    }
    
}
