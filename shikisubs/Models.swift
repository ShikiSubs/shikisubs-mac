//
//  Models.swift
//  shikisubs
//
//  Created by Arda Yiğit Tok on 8.01.2025.
//

import Foundation

struct Initial: Decodable {
    let author: String
    let contact: String
    let version: String
    let releaseName: String
    let status: String
    let admin: Bool
    
    enum CodingKeys: String, CodingKey {
        case author
        case contact
        case version
        case releaseName = "release-name"
        case status
        case admin
    }
}

struct Anime: Decodable, Identifiable {
    let name: String
    let slug: String
    let id: Int
    let version: String
    let synopsis: String
    let genres: String
    let coverArt: String
    let releaseDate: String
    let createdBy: String
    let createdTime: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case slug
        case id
        case version
        case synopsis
        case genres
        case coverArt = "cover_art"
        case releaseDate = "release_date"
        case createdBy = "created_by"
        case createdTime = "created_time"
    }
}

struct AnimeEpisode: Decodable, Identifiable {
    let id: Int
    let episodeNumber: String
    let specialType: String
    let animeName: String
    let coverArt: String
    let createdBy: String
    let createdTime: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case episodeNumber = "episode_number"
        case specialType = "special_type"
        case animeName = "anime_name"
        case coverArt = "cover_art"
        case createdBy = "created_by"
        case createdTime = "created_time"
    }
}

struct LatestWorks: Decodable {
    let animes: [Anime]
    let episodes: [AnimeEpisode]
}
