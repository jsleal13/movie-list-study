//
//  HomeRequestInfos.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import Foundation

struct HomeRequestInfos: RequestInfos {
    var endpoint: String {
        "3/trending/movie/day"
    }

    var parameters: [String : String]? {
        [ "language": "en-US" ]
    }
}
