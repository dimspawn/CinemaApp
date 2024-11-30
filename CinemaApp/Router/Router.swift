//
//  Router.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation

class Router {
    func makeDetailView(for movieId: Int) -> DetailView {
        let getDetailUseCase: Interactor<
            Int,
            DetailModel,
            GetDetailRepository<
                GetDetailRemoteDataSource,
                DetailTransformer
            >
        > = Injection.init().provideDetail()
        let isFavoriteUseCase: Interactor<
            Int,
            Bool,
            IsFavoriteRepository<FavoriteLocalDataSource>
        > = Injection.init().provideIsFavorite()
        let addFavoriteUseCase: Interactor<
            DetailModel,
            Bool,
            AddFavoriteRepository<
                FavoriteLocalDataSource,
                FavoriteTransformer
            >
        > = Injection.init().provideAddFavorite()
        let deleteFavoriteUseCase: Interactor<
            Int,
            Bool,
            DeleteFavoriteRepository<FavoriteLocalDataSource>
        > = Injection.init().provideDeleteFavorite()
        let presenter = DetailPresenter(
            id: movieId,
            getDetailUseCase: getDetailUseCase,
            isFavoriteUseCase: isFavoriteUseCase,
            addFavoriteUseCase: addFavoriteUseCase,
            deleteFavoriteUseCase: deleteFavoriteUseCase
        )
        return DetailView(presenter: presenter)
    }
    
    func makeFavoriteView() -> FavoriteView<DetailView> {
        let getFavoriteUseCase: Interactor<
            Any,
            [FavoriteModel],
            GetFavoriteRepository<
                FavoriteLocalDataSource,
                FavoritesTransformer
            >
        > = Injection.init().provideGetFavorite()
        let presenter = FavoritePresenter(getFavoriteUseCase: getFavoriteUseCase)
        return FavoriteView<DetailView>(
            presenter: presenter) { id in
                self.makeDetailView(for: id)
            }
    }
    
    func makeProfileView() -> ProfileView {
        return ProfileView()
    }
}
