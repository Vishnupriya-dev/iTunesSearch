//
//  MediaDetailView.swift
//  iTunesApp
//
//  Created by Vishnu on 19/07/24.
//

import SwiftUI

struct MediaDetailView: View, Identifiable {
    let id = UUID()
    let item: MediaItemModel

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                if let url = item.artworkUrl100, let imageUrl = URL(string: url) {
                    AsyncImage(url: imageUrl)
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                }
                VStack(spacing: 10) {
                    Text(item.trackName ?? "Miitwa")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.artistName ?? "")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)

                    Text(item.primaryGenreName ?? "")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
            }
            if let previewUrl = item.previewUrl, let url = URL(string: previewUrl) {
                AudioPlayerView(url: url)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            if let description = item.longDescription {
                Text(description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
            }
            Spacer()
        }
        //.padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle("Description")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.white) // Set navigation bar title color to white
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var mediaItem = MediaItemModel()
        mediaItem.primaryGenreName = "Bollywood"
        mediaItem.artistName = "A.R. Rahman, Alka Yagnik, Srinivas, Sukhwinder Singh & Udit Narayan"
        mediaItem.previewUrl = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/c5/da/2b/c5da2bfd-28df-c4e6-9382-24ac2c73adaf/mzaf_3453437878333597243.plus.aac.p.m4a"
        mediaItem.artworkUrl100 = "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/de/6d/3f/de6d3ff9-13c6-d70c-9010-0709e3780a84/886444202091.jpg/100x100bb.jpg"
      return  MediaDetailView(item: mediaItem)
    }
}
