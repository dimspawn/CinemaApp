//
//  FavoritesTransformer.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation

public struct FavoritesTransformer: Mapper {
    public typealias Response = Any
    public typealias Entity = [FavoriteEntity]
    public typealias Domain = [FavoriteModel]
    
    public init(){}
    
    public func transformResponseToEntity(response: Response) -> [FavoriteEntity] {
        fatalError()
    }
    
    public func transformEntityToDomain(entity: [FavoriteEntity]) -> [FavoriteModel] {
        return entity.map { result in
            return FavoriteModel(
                id: result.id,
                title: result.title,
                posterPath: result.posterPath,
                overview: result.overview,
                popularity: result.popularity,
                releaseDate: result.releaseDate,
                voteAverage: result.voteAverage,
                voteCount: result.voteCount
            )
        }
    }
    
    public func transformResponseToDomain(response: Response) -> [FavoriteModel] {
        fatalError()
    }
    
    public func transformDomainToEntity(domain: [FavoriteModel]) -> [FavoriteEntity] {
        return domain.map { result in
            let favorite = FavoriteEntity()
            favorite.id = result.id
            favorite.title = result.title
            favorite.posterPath = result.posterPath ?? ""
            favorite.overview = result.overview
            favorite.popularity = result.popularity
            favorite.releaseDate = result.releaseDate ?? "TBA"
            favorite.voteAverage = result.voteAverage
            favorite.voteCount = result.voteCount
            return favorite
        }
    }
}
