//
//  PokemonViewModel.swift
//  AsianPokedexApp
//
//  Created by 渡邊魁優 on 2023/02/19.
//
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [PokemonData] = [
        PokemonData(dicId: 0, name: "リザードン", image: "rizardon"),
        PokemonData(dicId: 0, name: "カメックス", image: "rizardon"),
        PokemonData(dicId: 0, name: "フシギバナ", image: "rizardon"),
    ]
    private var cancellable = Set<AnyCancellable>()

    let api = API()

    func fetch() async {
        let pokemons = await api.asyncFetchPokemoData(type: .pokemon).sorted { $0 < $1 }
        let pokemonNames = await api.asyncFetchPokemoData(type: .pokemonName).sorted { $0 < $1 }

        var pokemonDatas: [PokemonData] = []

        for i in 0...pokemons.count-1 {
            let name = pokemonNames[i].names?[0].name ?? ""
            let id = pokemons[i].id
            let image = pokemons[i].sprites?.frontImage
            let compileData = PokemonData(dicId: id, name: name,
                                      image: image)
            pokemonDatas.append(compileData)
        }

        await setLists(pokemonDatas)
    }

    @MainActor private func setLists(_ pokemons: [PokemonData]) {
        self.pokemons = pokemons
    }
}
