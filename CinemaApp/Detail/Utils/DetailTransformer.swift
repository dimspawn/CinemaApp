//
//  DetailTransformer.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation

public struct DetailTransformer: Mapper {
    public typealias Response = DetailResponse
    public typealias Entity = Any
    public typealias Domain = DetailModel
    
    public init() {}
    
    public func transformResponseToDomain(response: DetailResponse) -> DetailModel {
        return DetailModel(
            id: response.id ?? 0,
            backdropPath: response.backdropPath,
            genres: response.genres.map { genre in
                return GenreModel(id: genre.id ?? 0, name: genre.name ?? "")
            },
            overview: response.overview ?? "",
            popularity: response.popularity ?? 0,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate ?? "TBA",
            runtime: response.runtime ?? 0,
            tagline: response.tagline ?? "[No Tagline]",
            title: response.title ?? "[No Title]",
            voteAverage: response.voteAverage ?? 0.0,
            voteCount: response.voteCount ?? 0
        )
    }
    
    public func transformEntityToDomain(entity: Any) -> DetailModel {
        fatalError()
    }
    
    public func transformResponseToEntity(response: DetailResponse) -> Any {
        fatalError()
    }
    
    public func transformDomainToEntity(domain: DetailModel) -> Any {
        fatalError()
    }
}
