//
//  AnimeGridView.swift
//  shikisubs
//
//  Created by Arda Yiğit Tok on 8.01.2025.
//

import SwiftUI

struct AnimeGridView: View {
    let animeList: [Anime]
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(animeList) { anime in
                    VStack {
                        AsyncImage(url: URL(string: anime.coverArt)) { image in
                            image
                                .image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 220)
                                .clipped()
                        }
                        
                        Text(anime.name)
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
