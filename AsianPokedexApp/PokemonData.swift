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
class PokemonData: ObservableObject {
    @Published var pokemons: [PokemonModel] = [
        PokemonModel(name: "リザードン", image: "rizardon"),
        PokemonModel(name: "カメックス", image: "rizardon"),
        PokemonModel(name: "フシギバナ", image: "rizardon"),
        PokemonModel(name: "ミュウツー", image: "rizardon")
    ]
}
