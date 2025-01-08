//
//  NetworkManager.swift
//  shikisubs
//
//  Created by Arda Yiğit Tok on 8.01.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://shikisubs.com/api"
    
    private init() {}
    
    /*
     Örnek bir response: /api
     {
     "author": "aybertocarlos",
     "contact": "aybertocarlos@gmail.com",
     "version": "3.4.1",
     "release-name": "v4soon™",
     "status": "OK",
     "admin": false
     }
     */
    
    func fetchInitial() async throws -> Initial {
        
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(Initial.self, from: data)
    }
    
    func fetchAnimeList() async throws -> [Anime] {
        guard let url = URL(string: baseURL + "/latest-works") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let latestWorks = try decoder.decode(LatestWorks.self, from: data)
        
        return latestWorks.animes
    }
    
    func fetchLatestEpisodes() async throws -> [AnimeEpisode] {
        guard let url = URL(string: baseURL + "/latest-works") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
                throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let latestWorks = try decoder.decode(LatestWorks.self, from: data)
        
        return latestWorks.episodes
    }
}
