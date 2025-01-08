//
//  ContentView.swift
//  shikisubs
//
//  Created by Arda Yiğit Tok on 8.01.2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        HStack {
            VStack {
                Text("Animeler")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                if viewModel.isAnimeListLoaded {
                    AnimeGridView(animeList: viewModel.animeList)
                }
                
                if viewModel.isLoading {
                    ProgressView("Yükleniyor...")
                } else if let error = viewModel.errorMessage {
                    Text("Hata: \(error)")
                        .foregroundStyle(.red)
                }
                
                Spacer()
                
                Text("En Yeni Bölümler")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                if viewModel.isEpisodeListLoaded {
                    EpisodeGridView(episodeList: viewModel.episodeList)
                }
            }
            .padding()
            
            .task {
                await viewModel.checkServerStatus()
                
                if viewModel.initialData?.status != "OK" {
                    return
                }
                
                await viewModel.getAnimeList()
                await viewModel.getEpisodeList()
                
                viewModel.isLoading = false
            }
        }
        .frame(minWidth: 1200, minHeight: 900)
        .navigationTitle("ShikiSubs")
    }
}

#Preview {
    ContentView()
}
