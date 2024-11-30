//
//  AddFavoriteRepository.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import Combine

public struct AddFavoriteRepository<
    FavoriteLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository
where
FavoriteLocaleDataSource.Response == FavoriteEntity,
Transformer.Response == Any,
Transformer.Entity == FavoriteEntity,
Transformer.Domain == DetailModel {
    public typealias Request = DetailModel
    public typealias Response = Bool
    
    private let _localDataSource: FavoriteLocaleDataSource
    private let _mapper: Transformer
    
    public init(
        localDataSource: FavoriteLocaleDataSource,
        mapper: Transformer
    ) {
        _localDataSource = localDataSource
        _mapper = mapper
    }
    
    public func execute(request: DetailModel?) -> AnyPublisher<Bool, Error> {
        guard let detail = request else { fatalError() }
        let favModel = _mapper.transformDomainToEntity(domain: detail)
        var favs: [FavoriteEntity] = []
        favs.append(favModel)
        return _localDataSource.add(entities: favs).eraseToAnyPublisher()
    }
}
