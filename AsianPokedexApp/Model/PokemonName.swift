//
//  PokemonName.swift
//  AsianPokedexApp
//
//  Created by Johnny Toda on 2023/02/19.
//

import Foundation

// ポケモンの日本語名のデータ構造
struct PokemonName: Decodable {
    // 各国ごとのポケモンの名前をまとめた配列
    let names: [Name]
    // 地方ごとのポケモン図鑑No.をまとめた配列
    let ids: [PokeDex]

    // デコードの際の代替キーをidsにセット
    enum CodingKeys: String, CodingKey {
        case names
        case ids = "pokedex_numbers"
    }
}

// ポケモンの名前のデータ構造
struct Name: Decodable {
    // ポケモンの名前
    let name: String
}

// ポケモン図鑑のデータ構造
struct PokeDex: Decodable {
    // ポケモンの図鑑No.
    let id: Int

    // デコードの際の代替キーをidにセット
    enum CodingKeys: String, CodingKey {
        case id = "entry_number"
    }
}
