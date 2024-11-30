//
//  GetNowPlayingRemoteDataSource.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
import Combine
import Alamofire

public struct GetNowPlayingRemoteDataSource: DataSource {
    public typealias Request = Any
    public typealias Response = [NowPlayingResponse]
    private let _endpoint: String
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    
    public func execute(request: Any?) -> AnyPublisher<[NowPlayingResponse], Error> {
        return Future<[NowPlayingResponse], Error> { completion in
            if let url = URL(string: _endpoint) {
                let parameters: Parameters = [
                    "api_key": API.apiKey
                ]
                AF.request(url, parameters: parameters)
                    .validate()
                    .responseDecodable(of: NowPlayingResponses.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.movies))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
