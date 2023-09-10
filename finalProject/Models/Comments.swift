//
//  Comments.swift
//  finalProject
//
//  Created by Muneera Y on 24/02/1445 AH.
//

import Foundation
struct Comment: Identifiable {
    var id: UUID = UUID()
    var userID: String
    var gameID: String
    var text: String
    var rating: Int
}
