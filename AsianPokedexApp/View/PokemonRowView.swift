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
//        GeometryReader { geometry in
            HStack{
                Image(pokemon.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .border(Color.black)
                Text(pokemon.name)
                    .frame(width: 120, height: 50)
                    .border(Color.black)
            }
//        }
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRowView(pokemon: PokemonModel.init(name: "リザードン", image: "rizardon"))
    }
}
