//
//  GetFavoriteRepository.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import Combine

public struct GetFavoriteRepository<
    FavoriteLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository
where
FavoriteLocaleDataSource.Response == FavoriteEntity,
Transformer.Response == Any,
Transformer.Entity == [FavoriteEntity],
Transformer.Domain == [FavoriteModel] {
    public typealias Request = Any
    public typealias Response = [FavoriteModel]
    
    private let _localDataSource: FavoriteLocaleDataSource
    private let _mapper: Transformer
    
    public init (
        localDataSource: FavoriteLocaleDataSource,
        mapper: Transformer
    ) {
        _localDataSource = localDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<[FavoriteModel], Error> {
        return _localDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
    }
}

