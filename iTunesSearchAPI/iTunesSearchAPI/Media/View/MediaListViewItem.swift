//
//  MediaListViewItem.swift
//  iTunesSearchAPI
//
//  Created by Vishnu on 20/07/24.
//

import SwiftUI

struct MediaListViewItem: View {
    let item: MediaItemModel

    var body: some View {
        HStack {
            if let url = item.artworkUrl100, let imageUrl = URL(string: url) {
                AsyncImage(url: imageUrl)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading) {
                Text(item.trackName ?? "")
                    .font(.headline)
                    .foregroundColor(.white) // Set text color to white for readability
                Text(item.artistName ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray) // Set text color to gray for readability
            }
        }
    }
}

struct MediaListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        var mediaItem = MediaItemModel()
        mediaItem.primaryGenreName = "Bollywood"
        mediaItem.artistName = "A.R. Rahman, Alka Yagnik, Srinivas, Sukhwinder Singh & Udit Narayan"
        mediaItem.previewUrl = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/c5/da/2b/c5da2bfd-28df-c4e6-9382-24ac2c73adaf/mzaf_3453437878333597243.plus.aac.p.m4a"
        mediaItem.artworkUrl100 = "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/de/6d/3f/de6d3ff9-13c6-d70c-9010-0709e3780a84/886444202091.jpg/100x100bb.jpg"
      return
        MediaListViewItem(item: mediaItem)
    }
}
