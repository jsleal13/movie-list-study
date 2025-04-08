//
//  FavoriteStorage.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 07/04/25.
//

import Foundation

class FavoriteStorage {
    static let shared = FavoriteStorage()
    private let userDefaults = UserDefaults.standard
    private let favoriteKey = "favorite_movies"

    func saveMovie(movie: MovieModel) {
        var favoriteList = loadMovies()

        favoriteList[movie.id] = movie

        if let encoded = try? JSONEncoder().encode(favoriteList) {
            userDefaults.set(encoded, forKey: favoriteKey)
        }
    }

    func loadMovies() -> [Int: MovieModel] {
        if let data = userDefaults.data(forKey: favoriteKey),
           let favoriteList = try? JSONDecoder().decode([Int: MovieModel].self, from: data) {
            return favoriteList
        }
        return [:]
    }

    func removeMovie(id: Int) {
        var favoriteList = loadMovies()
        favoriteList.removeValue(forKey: id)

        if let encoded = try? JSONEncoder().encode(favoriteList) {
            userDefaults.set(encoded, forKey: favoriteKey)
        }
    }
}
