//
//  Users.swift
//  Homework 5 TableView, Navigation
//
//  Created by Ravil Gubaidulin on 27.08.2022.
//

import Foundation

struct User {
    var name: String
    var surname: String
    var patronymic: String
    var job: String
    var city: String
    var avatar: String
    
    var fullName: String {
       return surname + " " + name + " " + patronymic
    }
}
