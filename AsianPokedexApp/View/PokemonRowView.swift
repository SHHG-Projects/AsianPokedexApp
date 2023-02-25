//
//  PokemonRowView.swift
//  PokemonList
//
//  Created by sako0602 on 2023/02/19.
//

import SwiftUI

struct PokemonRowView: View {
    @State var pokemon: PokemonModel
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: pokemon.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 126)
            Text(pokemon.name)
                .frame(width: 120, height: 50)
                .border(Color.black)
        }
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRowView(pokemon: PokemonModel(name: "リザードン", image: "rizardon"))
    }
}
