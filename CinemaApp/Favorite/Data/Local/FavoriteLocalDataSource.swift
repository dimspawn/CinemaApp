//
//  FavoriteLocalDataSource.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import Combine
import RealmSwift

public struct FavoriteLocalDataSource: LocaleDataSource {
    public typealias Request = Any
    public typealias Response = FavoriteEntity
    
    private let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[FavoriteEntity], Error> {
        return Future<[FavoriteEntity], Error> { completion in
            let movies: Results<FavoriteEntity> = {
                realm.objects(FavoriteEntity.self)
                    .sorted(byKeyPath: "title", ascending: true)
            }()
            completion(.success(movies.toArray(ofType: FavoriteEntity.self)))
        }.eraseToAnyPublisher()
    }
    
    public func add(entities: [FavoriteEntity]) -> AnyPublisher<Bool, Error> {
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
        return Future<Bool, Error> { completion in
            do {
                let movie = realm.objects(FavoriteEntity.self).filter("id = \(id)").first
                try realm.write {
                    if let favMovie = movie {
                        realm.delete(favMovie)
                        completion(.success(true))
                    } else {
                        completion(.failure(DatabaseError.requestFailed))
                    }
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    
    public func isExist(id: Int) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            let movie = realm.objects(FavoriteEntity.self).filter("id = \(id)").first
            if movie != nil {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        }.eraseToAnyPublisher()
    }
}
