//
//  MediaListView.swift
//  iTunesSearchAPI
//
//  Created by Vishnu on 20/07/24.
//

import SwiftUI

struct MediaListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedValues: [String]

    let items = ["movie", "podcast", "music", "musicVideo", "audiobook", "shortFilm","tvShow", "software", "ebook"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                HStack {
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    if selectedValues.contains(item) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    }
                }
                .listRowBackground(Color.black)
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedValues.contains(item) {
                        selectedValues.removeAll { $0 == item }
                    } else {
                        selectedValues.append(item)
                    }
                }

            }
            .listStyle(PlainListStyle())
            .background(Color.black)
            .navigationTitle("Media")
            .foregroundColor(.white)
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text ("Done")
                }
            }
        }
        .background(Color.black)
    }
}

//struct MediaListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaListView()
//    }
//}
