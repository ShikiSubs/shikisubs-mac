//
//  EpisodeGridView.swift
//  shikisubs
//
//  Created by Arda Yiğit Tok on 9.01.2025.
//

import SwiftUI

struct EpisodeGridView: View {
    let episodeList: [AnimeEpisode]
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(episodeList) { episode in
                    VStack {
                        AsyncImage(url: URL(string: episode.coverArt)) { image in
                            image
                                .image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 220)
                                .clipped()
                        }
                        
                        Text("Bölüm " + episode.episodeNumber)
                            .font(.headline)
                            .lineLimit(2)
                            .frame(maxWidth: 150)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
    }
}
