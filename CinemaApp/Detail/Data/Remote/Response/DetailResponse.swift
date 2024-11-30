//
//  DetailResponse.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation

public struct GenreResponse: Decodable {
    let id: Int?
    let name: String?
}

public struct DetailResponse: Decodable {
    let id: Int?
    let backdropPath: String?
    let genres: [GenreResponse]
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let tagline: String?
    let title: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genres
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case tagline
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
