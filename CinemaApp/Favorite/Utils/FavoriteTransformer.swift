//
//  FavoriteTransformer.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation

public struct FavoriteTransformer: Mapper {
    public typealias Response = Any
    public typealias Entity = FavoriteEntity
    public typealias Domain = DetailModel
    
    public init(){}
    
    public func transformResponseToEntity(response: Any) -> FavoriteEntity {
        fatalError()
    }
    
    public func transformEntityToDomain(entity: FavoriteEntity) -> DetailModel {
        fatalError()
    }
    
    public func transformResponseToDomain(response: Any) -> DetailModel {
        fatalError()
    }
    
    public func transformDomainToEntity(domain: DetailModel) -> FavoriteEntity {
        let favorite = FavoriteEntity()
        favorite.id = domain.id
        favorite.title = domain.title
        favorite.posterPath = domain.posterPath ?? ""
        favorite.overview = domain.overview
        favorite.popularity = domain.popularity
        favorite.releaseDate = domain.releaseDate
        favorite.voteAverage = domain.voteAverage
        favorite.voteCount = domain.voteCount
        return favorite
    }
}
