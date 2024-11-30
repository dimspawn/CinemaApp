//
//  DetailModel.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation

public struct GenreModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct DetailModel: Equatable, Identifiable {
    public let id: Int
    public let backdropPath: String?
    public let genres: [GenreModel]
    public let overview: String
    public let popularity: Double
    public let posterPath: String?
    public let releaseDate: String
    public let runtime: Int?
    public let tagline: String
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(
        id: Int,
        backdropPath: String?,
        genres: [GenreModel],
        overview: String,
        popularity: Double,
        posterPath: String?,
        releaseDate: String,
        runtime: Int?,
        tagline: String,
        title: String,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.id = id
        self.backdropPath = backdropPath
        self.genres = genres
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.tagline = tagline
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
