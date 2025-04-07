//
//  MovieDetailRequestInfos.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation

struct MovieDetailRequestInfos: RequestInfos {
    var movieId: Int

    var endpoint: String {
        "3/movie/\(movieId)"
    }

    var parameters: [String : String]? {
        [ "language": "en-US" ]
    }
}
