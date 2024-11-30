//
//  NowPlayingResponse.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
public struct NowPlayingResponses: Decodable {
    let movies: [NowPlayingResponse]
    public enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

public struct NowPlayingResponse: Decodable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let overview: String?
    let popularity: Double?
    let releaseDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
        case popularity
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
