//
//  Injection.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private let realm = try? Realm()
    
    func provideNowPlaying<U: UseCase>() -> U where U.Request == Any, U.Response == [NowPlayingModel] {
        let local = NowPlayingLocalDataSource(realm: realm!)
        let remote = GetNowPlayingRemoteDataSource(endpoint: Endpoints.Gets.movies.url)
        let mapper = NowPlayingTransformer()
        let repository = GetNowPlayingRepository(
            localeDataSource: local,
            remoteDataSource: remote,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    
    func provideDetail<U: UseCase>() -> U where U.Request == Int, U.Response == DetailModel {
        let remote = GetDetailRemoteDataSource(endpoint: Endpoints.Gets.movieDetail.url)
        let mapper = DetailTransformer()
        let repository = GetDetailRepository(
            remoteDataSource: remote,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    
    func provideIsFavorite<U: UseCase>() -> U where U.Request == Int, U.Response == Bool {
        let local = FavoriteLocalDataSource(realm: realm!)
        let repository = IsFavoriteRepository(localDataSource: local)
        return Interactor(repository: repository) as! U
    }
    
    func provideAddFavorite<U: UseCase>() -> U where U.Request == DetailModel, U.Response == Bool {
        let local = FavoriteLocalDataSource(realm: realm!)
        let mapper = FavoriteTransformer()
        let repository = AddFavoriteRepository(
            localDataSource: local,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    
    func provideDeleteFavorite<U: UseCase>() -> U where U.Request == Int, U.Response == Bool {
        let local = FavoriteLocalDataSource(realm: realm!)
        let repository = DeleteFavoriteRepository(localDataSource: local)
        return Interactor(repository: repository) as! U
    }
    
    func provideGetFavorite<U: UseCase>() -> U where U.Request == Any, U.Response == [FavoriteModel] {
        let local = FavoriteLocalDataSource(realm: realm!)
        let mapper = FavoritesTransformer()
        let repository = GetFavoriteRepository(
            localDataSource: local,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
}
