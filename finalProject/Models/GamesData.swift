//
//  GamesData.swift
//  finalProject
//
//  Created by Muneera Y on 19/02/1445 AH.
//

import Foundation
import SwiftUI
struct GameData: Codable{
    var id = UUID().uuidString
    let name: String
    let images: [images]
    let about: String
    let details: [Detail]
    let stars: Int
    var age: String
}

struct images: Codable {
    let src: String

}

struct Detail: Codable {
    let key: String
    let values: [String]
}

enum Values: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        throw DecodingError.typeMismatch(Values.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}


