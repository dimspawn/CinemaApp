//
//  GetDetailRepository.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import Combine

public struct GetDetailRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
RemoteDataSource.Response == DetailResponse,
Transformer.Response == DetailResponse,
Transformer.Entity == Any,
Transformer.Domain == DetailModel {
    public typealias Request = Int
    public typealias Response = DetailModel
    
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer
    ) {
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Int?) -> AnyPublisher<DetailModel, Error> {
        return _remoteDataSource.execute(request: request as? RemoteDataSource.Request)
            .map { _mapper.transformResponseToDomain(response: $0)}
            .eraseToAnyPublisher()
    }
}
