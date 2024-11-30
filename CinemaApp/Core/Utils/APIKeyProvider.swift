//
//  APIKeyProvider.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 30/11/24.
//

import Foundation

class APIKeyProvider {
    static let shared = APIKeyProvider()
    private var apiKey: String?
    
    private init() {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            apiKey = dict["APIKey"] as? String
        }
    }
    
    func getAPIKey() -> String {
        return apiKey ?? ""
    }
}
