//
//  GameModel.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import Foundation
struct GameModel : Identifiable ,Hashable{
    let id: String = UUID().uuidString
    var GameName:String
    var GameDescription:String
    var imageName :String
    var GameRate:Int
    var gametype:GameType
    var GameAge: Int
    var GameComments:String
    var platforms : PlatForm
    var Pricing :String
    var Publisher :String
    var WhereToPlay:String
}
//platforms,Publisher,WhereToPlay,gametype,Release date,WhereToPlay

enum GameType:Codable {
    case all
    case action
    case adventure
    case sports
}
enum PlatForm : Codable {
    case NintendoSwitch
    case PlayStation
    case Windows
    case Xbox
}
