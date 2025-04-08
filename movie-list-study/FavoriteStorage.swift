//
//  FavoriteStorage.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 07/04/25.
//

import Foundation

class FavoriteStorage {
    static let shared = FavoriteStorage()
    private let favoritesKey = "favoriteMovies"

    private func getFavoriteMovies() -> [MovieDetailModel] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey) {
            let decoder = JSONDecoder()
            do {
                let movies = try decoder.decode([MovieDetailModel].self, from: data)
                return movies
            } catch {
                print("Erro ao decodificar filmes: \(error)")
            }
        }
        return []
    }

    private func saveFavoriteMovies(movies: [MovieDetailModel]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(movies)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Erro ao salvar filmes: \(error)")
        }
    }

    func addMovieToFavorites(movie: MovieDetailModel) {
        var favoriteMovies = getFavoriteMovies()

        if !favoriteMovies.contains(where: { $0.id == movie.id }) {
            favoriteMovies.append(movie)
            saveFavoriteMovies(movies: favoriteMovies)
        } else {
            removeMovieFromFavorites(movie: movie)
        }
    }

    func removeMovieFromFavorites(movie: MovieDetailModel) {
        var favoriteMovies = getFavoriteMovies()

        guard let index = favoriteMovies.firstIndex(where: { $0.id == movie.id }) else { return }
        favoriteMovies.remove(at: index)
        saveFavoriteMovies(movies: favoriteMovies)
    }

    func isFavorite(movie: MovieDetailModel) -> Bool {
        let favoriteMovies = getFavoriteMovies()
        return favoriteMovies.contains(where: { $0.id == movie.id })
    }
}
