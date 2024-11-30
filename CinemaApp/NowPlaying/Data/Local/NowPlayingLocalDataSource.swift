//
//  NowPlayingLocalDataSource.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
import RealmSwift
import Combine

public struct NowPlayingLocalDataSource: LocaleDataSource {
    public typealias Request = Any
    public typealias Response = NowPlayingEntity
    
    private let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[NowPlayingEntity], Error> {
        return Future<[NowPlayingEntity], Error> { completion in
            let movies: Results<NowPlayingEntity> = {
                realm.objects(NowPlayingEntity.self)
                    .sorted(byKeyPath: "title", ascending: true)
            }()
            completion(.success(movies.toArray(ofType: NowPlayingEntity.self)))
        }.eraseToAnyPublisher()
    }
    
    public func add(entities: [NowPlayingEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try realm.write {
                    for entity in entities {
                        realm.add(entity, update: .all)
                    }
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    
    public func delete(id: Int) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    public func isExist(id: Int) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
}
