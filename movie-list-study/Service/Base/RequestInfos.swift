//
//  RequestInfos.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 04/04/25.
//

import Foundation

enum HTTPMethodType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol RequestInfos {
    var baseURL: String { get }
    var endpoint: String { get }
    var parameters: [String : String]? { get }
    var accessToken: String? { get }
    var body: [String :  String]? { get }
    var httpMethod: HTTPMethodType { get }
}

extension RequestInfos {
    var baseURL: String {
        "https://api.themoviedb.org/"
    }

    var accessToken: String? {
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODg3MGRlMDU5N2FmZjc3MzNmZDNjMWIzN2UxYmJlOCIsIm5iZiI6MTc0Mzg3MzEwNy4yMDcsInN1YiI6IjY3ZjE2NDUzMGM3OTFiZWI1N2FkNTk0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OFJqypVzu36aMts6nE0n8W81Pl8LQk9BIDOrPt4DBXE"
    }

    var body: [String :  String]? {
        nil
    }

    var parameters: [String : String]? {
        nil
    }

    var httpMethod: HTTPMethodType {
        .get
    }
}
