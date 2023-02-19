

import SwiftUI


struct ContentView: View {
    
    @ObservedObject private var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Text("ポケモン検索")
                    .frame(width: geometry.size.width,height: geometry.size.height * 0.05)
                    .border(Color.black)
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(pokemonViewModel.pokemons) { pokemon in
                            PokemonRowView(pokemon: pokemon)
                            
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
