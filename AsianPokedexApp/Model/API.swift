//
//  API.swift
//  AsianPokedexApp
//
//  Created by Johnny Toda on 2023/02/19.
//

import Foundation

final class API {
    // getURLメソッドにて取得するURLを切り分けるための列挙型
    private enum TypeOfFetch {
        case pokemon
        case pokemonName
    }

    // async関数へのラップ関数
    func asyncFetchPokemoData() async -> [Pokemon] {
        return await withCheckedContinuation { continuation in
            decodePokemonData { result in
                switch result {
                case .success(let pokemons):
                    continuation.resume(returning: pokemons)
                case .failure(let error):
                    print(error)
                    fatalError()
                }
            }
        }
    }

    // 取得したポケモンのデータをSwiftの型として扱う為にデコード
    func decodePokemonNameData(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        // データの取得を実行
        fetchPokemonData(typeOfFetch: .pokemonName, completion: { result in
            switch result {
            case .success(let dataArray):
                var pokemons: [Pokemon] = []
                dataArray.forEach {
                    do {
                        let pokemon = try JSONDecoder().decode(Pokemon.self, from: $0)
                        pokemons.append(pokemon)
                    } catch {
                        completion(.failure(error))
                    }
                }
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

    // 取得したポケモンのデータをSwiftの型として扱う為にデコード
    func decodePokemonData(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        // データの取得を実行
        fetchPokemonData(typeOfFetch: .pokemon, completion: { result in
            switch result {
            case .success(let dataArray):
                var pokemons: [Pokemon] = []
                dataArray.forEach {
                    do {
                        let pokemon = try JSONDecoder().decode(Pokemon.self, from: $0)
                        pokemons.append(pokemon)
                    } catch {
                        completion(.failure(error))
                    }
                }
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

    // データを取得
    private func fetchPokemonData(typeOfFetch: TypeOfFetch, completion: @escaping (Result<[Data], Error>) -> Void) {
        let stringURLs = getURLs(typeOfFetch: typeOfFetch)

        // 取得したURLをString型からURL型に変換
        let urls = stringURLs.map { URL(string: $0) }

        // 取得したデータを格納する配列を定義
        var dataArray: [Data] = []

        urls.forEach {
            guard let url = $0 else { return }
            // タスクをセット
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                //　エラーが発生した場合はエラーを出力
                if let error = error {
                    completion(.failure(error))
                    return
                }
                // データをdataArrayに追加
                if let data = data {
                    dataArray.append(data)
                }
                // 全てのデータをdataArrayに格納した場合、引数クロージャにdataArrayを渡して実行
                if urls.count == dataArray.count {
                    completion(.success(dataArray))
                }
            }
            // 通信を実行
            task.resume()
        }
    }

    // 初代の全ポケモン151体分のデータのURLを取得
    private func getURLs(typeOfFetch: TypeOfFetch) -> [String] {
        let pokemonIdRange = 1...151
        let urls: [String] = pokemonIdRange.map {
            let url: String
            // 指定したタイプごとに取得するURLを切り替え
            switch typeOfFetch {
            case .pokemon: url = "https://pokeapi.co/api/v2/pokemon/\($0)/"
            case .pokemonName: url = "https://pokeapi.co/api/v2/pokemon-species/\($0)/"
            }
            return url
        }
        return urls
    }
}
