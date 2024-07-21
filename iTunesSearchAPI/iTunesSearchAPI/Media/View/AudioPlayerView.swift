//
//  AudioPlayerView.swift
//  iTunesSearchAPI
//
//  Created by Vishnu on 20/07/24.
//

import SwiftUI
import AVKit

struct AudioPlayerView: View {
    let url: URL
    @State private var player: AVPlayer?

    var body: some View {
        VStack {
            Button(action: {
                if player == nil {
                    player = AVPlayer(url: url)
                    player?.play()
                } else {
                    player?.pause()
                    player = nil
                }
            }) {
                Text(player == nil ? "Play Preview" : "Stop Preview")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .onDisappear {
            player?.pause()
        }
    }
}

//struct AudioPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        let urlString = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/c5/da/2b/c5da2bfd-28df-c4e6-9382-24ac2c73adaf/mzaf_3453437878333597243.plus.aac.p.m4a"
//        AudioPlayerView(url: URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") ?? "")
//    }
//}
