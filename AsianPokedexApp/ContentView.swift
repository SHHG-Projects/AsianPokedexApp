

import SwiftUI


struct ContentView: View {
    
    @ObservedObject private var pokemonData = PokemonData()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
//                Text("ポケモン検索")
//                    .frame(width: geometry.size.width,height: geometry.size.height * 0.05)
//                    .border(Color.black)
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(pokemonData.pokemons) { pokemon in
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

//                        ForEach((1...100), id: \.self) { index in
//                            HStack {
//                                Text("\(index)")
//                                    .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.1)
//                                    .border(Color.black)
//                                VStack{
//                                    Text("ポケモンの名前")
//                                        .lineLimit(1)
//                                        .minimumScaleFactor(0.3)
//
//                                    Text("中国語")
//                                    Text("韓国語")
//                                }
//                            }
//                        }
