//
//  TrendingMovies.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import Foundation

struct TrendingMovies: Codable {
    let page: Int
    let results: [MovieModel]
}

struct MovieModel: Codable {
    let backdropPath: String
    let id: Int
    let title, originalTitle, overview, posterPath: String
    let mediaType: String
    let adult: Bool
    let originalLanguage: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
