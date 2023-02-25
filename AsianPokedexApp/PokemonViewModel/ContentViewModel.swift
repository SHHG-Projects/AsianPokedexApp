//
//  ContentViewModel.swift
//  AsianPokedexApp
//
//  Created by 渡邊魁優 on 2023/02/19.
//
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [PokemonModel] = [
        PokemonModel(name: "リザードン", image: "rizardon"),
        PokemonModel(name: "カメックス", image: "rizardon"),
        PokemonModel(name: "フシギバナ", image: "rizardon")
    ]
    
    let api = API()

    func fetch() async {
        let items = await api.asyncFetchPokemoData()
        let pokemons: [PokemonModel] = items.map { PokemonModel(name: $0.name, image:  $0.sprites.frontImage) }
        await setLists(pokemons)
    }

    @MainActor private func setLists(_ pokemons: [PokemonModel]) {
        self.pokemons = pokemons
    }
}
