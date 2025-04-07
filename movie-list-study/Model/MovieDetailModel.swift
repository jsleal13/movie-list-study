//
//  MovieDetailModel.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation
struct MovieDetailModel: Codable {
    let adult: Bool
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID: String
    let originCountry: [String]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String

    enum CodingKeys: String, CodingKey {
        case adult, genres, homepage, id
        case imdbID = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime, status, tagline, title
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
