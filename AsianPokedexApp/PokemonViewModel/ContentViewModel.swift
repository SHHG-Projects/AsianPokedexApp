//
//  ContentViewModel.swift
//  AsianPokedexApp
//
//  Created by 渡邊魁優 on 2023/02/19.
//
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemons: [PokemonModel] = [
        PokemonModel(name: "リザードン", image: "rizardon"),
        PokemonModel(name: "カメックス", image: "rizardon"),
        PokemonModel(name: "フシギバナ", image: "rizardon")
    ]
    
    let api = API()
    
    func onAppear() {
        api.decodePokemonData(completion: <#T##(Result<[Pokemon], Error>) -> Void#>)
    }
}
