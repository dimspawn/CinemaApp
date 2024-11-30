//
//  DeleteFavoriteRepository.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import Combine

public struct DeleteFavoriteRepository<
    FavoriteLocaleDataSource: LocaleDataSource>: Repository
where
FavoriteLocaleDataSource.Response == FavoriteEntity {
    public typealias Request = Int
    public typealias Response = Bool
    
    private let _localDataSource: FavoriteLocaleDataSource
    
    public init(
        localDataSource: FavoriteLocaleDataSource
    ) {
        _localDataSource = localDataSource
    }
    
    public func execute(request: Int?) -> AnyPublisher<Bool, Error> {
        guard let id = request else { fatalError() }
        return _localDataSource.delete(id: id).eraseToAnyPublisher()
    }
}
