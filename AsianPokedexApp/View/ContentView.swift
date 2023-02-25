

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        List {
            ForEach(viewModel.pokemons, id: \.self) { item in
                PokemonRowView(pokemon: item)
            }
        }
        .navigationTitle("ポケモン一覧")
        .task {
            await viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
