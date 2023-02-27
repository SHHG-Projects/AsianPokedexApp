//
//  Pokemon.swift
//  AsianPokedexApp
//
//  Created by Johnny Toda on 2023/02/19.
//

import Foundation

// ポケモンのデータ構造
struct Pokemon: Decodable, Comparable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }

    static func < (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id < rhs.id
    }

    // ポケモンの名前
    let name: String
    // ポケモンの図鑑No.
    let id: Int
    // ポケモンの画像
    let sprites: Image?
    // ポケモンの種別
    let names: [Name]?
}

// 画像のデータ構造
struct Image: Decodable {
    // ポケモンが正面向きの画像
    let frontImage: String

    // デコードの際の代替キーをfrontImageプロパティにセット
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}
