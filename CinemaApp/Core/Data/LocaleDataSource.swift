//
//  LocaleDataSource.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 01/09/23.
//

import Foundation
import Combine

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entities: [Response]) -> AnyPublisher<Bool, Error>
    func delete(id: Int) -> AnyPublisher<Bool, Error>
    func isExist(id: Int) -> AnyPublisher<Bool, Error>
}
