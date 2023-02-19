//
//  PokemonData.swift
//  PokemonList
//
//  Created by sako0602 on 2023/02/19.
//

import Foundation

struct PokemonModel: Identifiable {
    let id = UUID()
    var name: String
    var image: String
}

