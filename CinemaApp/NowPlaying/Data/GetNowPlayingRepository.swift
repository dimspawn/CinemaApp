//
//  GetNowPlayingRepository.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
import Combine

public struct GetNowPlayingRepository<
    NowPlayingLocaleDataSource: LocaleDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
NowPlayingLocaleDataSource.Response == NowPlayingEntity,
RemoteDataSource.Response == [NowPlayingResponse],
Transformer.Response == [NowPlayingResponse],
Transformer.Entity == [NowPlayingEntity],
Transformer.Domain == [NowPlayingModel] {
    public typealias Request = Any
    public typealias Response = [NowPlayingModel]
    
    private let _localeDataSource: NowPlayingLocaleDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: NowPlayingLocaleDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer
    ) {
        _localeDataSource = localeDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<[NowPlayingModel], Error> {
        return _localeDataSource.list(request: nil)
            .flatMap { result -> AnyPublisher<[NowPlayingModel], Error> in
                if result.isEmpty {
                    return _remoteDataSource.execute(request: nil)
                        .map { _mapper.transformResponseToEntity(response: $0)}
                        .catch { _ in _localeDataSource.list(request: nil) }
                        .flatMap { _localeDataSource.add(entities: $0) }
                        .filter { $0 }
                        .flatMap { _ in _localeDataSource.list(request: nil) }
                        .map { _mapper.transformEntityToDomain(entity: $0) }
                        .eraseToAnyPublisher()
                } else {
                    return _localeDataSource.list(request: nil)
                        .map { _mapper.transformEntityToDomain(entity: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
