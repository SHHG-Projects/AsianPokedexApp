//
//  PokemonData.swift
//  PokemonList
//
//  Created by sako0602 on 2023/02/19.
//

import Foundation

struct PokemonData: Identifiable, Hashable {
    let id = UUID()
    let dicId: Int
    var name: String
    var image: String?
}

