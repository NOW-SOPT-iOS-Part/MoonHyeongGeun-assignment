//
//  Config.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 5/10/24.
//
import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found.")
        }
        print("Info.plist successfully loaded.")
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let url = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        print("Retrieved Base URL from Info.plist: \(url)")
        return url
    }()
    
    static let apiKey: String = {
        guard let apiKey = Config.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API Key is not set in plist for this configuration.")
        }
        print("Retrieved API Key from Info.plist: \(apiKey)")
        return apiKey
    }()
}

