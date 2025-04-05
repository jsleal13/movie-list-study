//
//  APIClient.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 04/04/25.
//

import Foundation

protocol RequestProtocol {
    func request<T: Codable>(target: RequestInfos,
                         then handler: @escaping ((Result<T, Error>) -> Void)) async throws -> (T) where T : Decodable, T : Encodable
}

enum ServiceError: Error {
    case noComponents
}

class APIClient: RequestProtocol {
    let urlSession = URLSession.shared
    static let shared = APIClient()

    func request<T>(target: RequestInfos, then handler: @escaping ((Result<T, Error>) -> Void)) async throws -> (T) where T : Decodable, T : Encodable {
        let url = target.baseURL + target.endpoint
        guard var components = URLComponents(string: url) else { throw ServiceError.noComponents }

        if let parameters = target.parameters {
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }

        guard let requestUrl = components.url else { throw ServiceError.noComponents }
        var request = URLRequest(url: requestUrl)

        if let token = target.accessToken {
            request.setValue(token, forHTTPHeaderField: "rapidapi-key")
        }
        request.setValue("moviesdatabase.p.rapidapi.com", forHTTPHeaderField: "rapidapi-host")
        
        let (data, response) = try await urlSession.data(from: requestUrl)
        let responseValue = try JSONDecoder().decode(T.self, from: data)
        return responseValue
    }
}
