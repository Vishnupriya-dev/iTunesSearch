//
//  MediaItemModel.swift
//  iTunesApp
//
//  Created by Vishnu on 19/07/24.
//

import Foundation

struct MediaItemModel: Identifiable, Decodable, Hashable {
    var id = UUID()
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var previewUrl: String?
    var primaryGenreName: String?
    var longDescription: String?
    var kind: String?
    
    enum CodingKeys: String, CodingKey {
        case trackName, artistName, artworkUrl100, previewUrl, primaryGenreName, longDescription, kind
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100)
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
        self.primaryGenreName = try container.decodeIfPresent(String.self, forKey: .primaryGenreName)
        self.longDescription = try container.decodeIfPresent(String.self, forKey: .longDescription)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
    }
    init() {}
}

