//
//  ContentView.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var  nowPlayingPresenter: NowPlayingPresenter<
        Any,
        NowPlayingModel,
        Interactor<
            Any,
            [NowPlayingModel],
            GetNowPlayingRepository<
                NowPlayingLocalDataSource,
                GetNowPlayingRemoteDataSource,
                NowPlayingTransformer
            >
        >
    >
    
    let router = Router()
    
    var body: some View {
        NavigationView {
            NowPlayingView<
                FavoriteView<DetailView>,
                ProfileView,
                DetailView
            >(
                presenter: nowPlayingPresenter,
                detailRouter: { id in
                    router.makeDetailView(for: id)
                },
                profileRouter: {
                    router.makeProfileView()
                },
                favoriteRouter: {
                    router.makeFavoriteView()
                }
            )
        }
    }
}
