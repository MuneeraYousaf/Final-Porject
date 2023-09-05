//
//  UserModel.swift
//  finalProject
//
//  Created by Muneera Y on 14/02/1445 AH.
//

import Foundation

struct UserModel: Identifiable{
    typealias ID = String
    var id: ID = .init()
    let username: String
    let image: String
//    let password:String
    let phone: String
    let email: String
}
