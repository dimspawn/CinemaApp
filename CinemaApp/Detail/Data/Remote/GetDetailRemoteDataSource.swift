//
//  GetDetailRemoteDataSource.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
import Combine
import Alamofire

public struct GetDetailRemoteDataSource: DataSource {
    public typealias Request = Int
    public typealias Response = DetailResponse
    private let _endpoint: String
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    
    public func execute(request: Int?) -> AnyPublisher<DetailResponse, Error> {
        return Future<DetailResponse, Error> { completion in
            guard let id = request else { fatalError() }
            if let url = URL(string: _endpoint + "\(id)") {
                let parameters: Parameters = [
                    "api_key": API.apiKey
                ]
                AF.request(url, parameters: parameters)
                    .validate()
                    .responseDecodable(of: DetailResponse.self) { response in
                        switch response.result {
                        case .success(let value): completion(.success(value))
                        case .failure: completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
