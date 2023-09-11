//
//  UserModel.swift
//  finalProject
//
//  Created by Muneera Y on 14/02/1445 AH.
//

import Foundation

struct UserModel: Identifiable{
    var id = UUID()
    let username: String
    let image: String
    let phone: String
    let email: String
}
