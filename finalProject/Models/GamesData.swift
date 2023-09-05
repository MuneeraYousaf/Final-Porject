//
//  GamesData.swift
//  finalProject
//
//  Created by Muneera Y on 19/02/1445 AH.
//

import Foundation
import SwiftUI
struct GameData: Codable{
    let id: String
    let name: String
    let images: [Image]
    let about: String
    let details: [Detail]
    let stars: Int
    let age: String
}

struct Image: Codable {
    let src: String

}

struct Detail: Codable {
    let key: String
    let values: [Value]
}

enum Value: Codable {
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
        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
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

//struct Detail: Codable {
//    let key: String?
//    let values: [Value]
//
//    private enum CodingKeys: String, CodingKey {
//        case key
//        case values
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        key = try container.decodeIfPresent(String.self, forKey: .key)
//        values = try container.decode([Value].self, forKey: .values)
//    }
//}
