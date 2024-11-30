//
//  APICall.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
public struct API {
    static let baseUrl = "https://api.themoviedb.org/3/"
    public static let imageSource = "https://image.tmdb.org/t/p/original"
    public static var apiKey = "bc64203d9789bfe5a2185d4c651c5602"
}

protocol Endpoint {
    var url: String { get }
}

public enum Endpoints {
    public enum Gets: Endpoint {
        case movies
        case movieDetail
        
        public var url: String {
            switch self {
            case .movies:
                return "\(API.baseUrl)movie/now_playing"
            case .movieDetail:
                return "\(API.baseUrl)movie/"
            }
        }
    }
}
