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
        "https://moviesdatabase.p.rapidapi.com/"
    }

    var accessToken: String {
        "fae0b0aea3msh0298238ab1eb40cp1ed49cjsnbc899cbc25dd"
    }
}
