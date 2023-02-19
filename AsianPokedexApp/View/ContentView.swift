

import SwiftUI


struct ContentView: View {
    
    @State private var array = ["sako","jhony","kai"]
//    @StateObject private var pokemonViewModel = PokemonViewModel()
    @State private var serchText = ""
    
    var searchResults: [String] {
        if serchText.isEmpty {
            return array
//            return pokemonViewModel.pokemons
        } else {
//            return pokemonViewModel.pokemons.filter{ $0.contains(serchText) }
            return array.filter{ $0.contains(serchText) }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
                
                ScrollView {
                    LazyVGrid(
                        columns: Array(repeating: GridItem(), count: 2)
                    ) {
                        ForEach(pokemonViewModel.pokemons) { pokemon in
                            PokemonRowView(pokemon: pokemon)
                        }
                    }
                }
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
