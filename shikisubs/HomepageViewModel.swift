//
//  HomepageViewModel.swift
//  shikisubs
//
//  Created by Arda Yiğit Tok on 8.01.2025.
//

import SwiftUI
import Combine

@MainActor
class HomepageViewModel: ObservableObject {
    @Published var animeList: [Anime] = []
    @Published var episodeList: [AnimeEpisode] = []
    @Published var isLoading = false
    @Published var isAnimeListLoaded = false
    @Published var isEpisodeListLoaded = false
    @Published var isServerOnline = false
    @Published var initialData: Initial? = nil
    
    var errorMessage: String? = nil
    
    func checkServerStatus() async {
        isLoading = true
        
        do {
            let initial = try await NetworkManager.shared.fetchInitial()
            initialData = initial
            if initial.status == "OK" {
                isServerOnline = true
            }
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    func getAnimeList() async {
        do {
            let list = try await NetworkManager.shared.fetchAnimeList()
            animeList = list
            isAnimeListLoaded = true
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    func getEpisodeList() async {
        do {
            let list = try await NetworkManager.shared.fetchLatestEpisodes()
            episodeList = list
            isEpisodeListLoaded = true
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
