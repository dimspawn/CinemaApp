//
//  FavoritePresenter.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import SwiftUI
import Combine

public class FavoritePresenter<
    Request,
    Response,
    GetFavoriteUseCase: UseCase>: ObservableObject
where
GetFavoriteUseCase.Request == Request,
GetFavoriteUseCase.Response == [Response] {
    private var cancellables: Set<AnyCancellable> = []
    private let _getFavoriteUseCase: GetFavoriteUseCase
    
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(getFavoriteUseCase: GetFavoriteUseCase) {
        _getFavoriteUseCase = getFavoriteUseCase
    }
    
    public func getList(request: Request?) {
        isLoading = true
        _getFavoriteUseCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            } receiveValue: { list in
                self.list = list
            }.store(in: &cancellables)

    }
}
