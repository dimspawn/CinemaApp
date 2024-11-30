//
//  CinemaAppApp.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import SwiftUI

let getNowPlayingUseCase: Interactor<
    Any,
    [NowPlayingModel],
    GetNowPlayingRepository<
        NowPlayingLocalDataSource,
        GetNowPlayingRemoteDataSource,
        NowPlayingTransformer
    >
> = Injection.init().provideNowPlaying()

@main
struct CinemaAppApp: App {
    let nowPlayingPresenter = NowPlayingPresenter(getNowPlayingUseCase: getNowPlayingUseCase)
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(nowPlayingPresenter)
        }
    }
}
