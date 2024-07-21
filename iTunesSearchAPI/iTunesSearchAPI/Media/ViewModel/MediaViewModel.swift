//
//  MediaViewModel.swift
//  iTunesApp
//
//  Created by Vishnu on 19/07/24.
//

import Foundation
import SwiftUI

class MediaViewModel: ObservableObject {
    @Published var mediaItems = [MediaItemModel]()

    var groupedMediaItems: [String: [MediaItemModel]] {
           Dictionary(grouping: mediaItems, by: { $0.kind ?? "Unknown" })
       }

    func searchMedia(query: String, mediaQuery: [String]) {
        var mediaQueryString = ""
        for mediaType in mediaQuery {
            mediaQueryString += "&media=\(mediaType)"
        }
        let urlString = "https://itunes.apple.com/search?term=\(query)\(mediaQueryString)&limit=20"
        print(urlString)
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                DispatchQueue.main.async {
                    self.mediaItems = result.results
                }
            } catch {
                print("Failed to decode JSON:", error)
            }
        }
        task.resume()
    }
}

struct SearchResult: Decodable {
    let results: [MediaItemModel]
}
