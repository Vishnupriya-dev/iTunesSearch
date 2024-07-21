//
//  MediaView.swift
//  iTunesSearchAPI
//
//  Created by Vishnu on 20/07/24.
//

import SwiftUI

enum ViewType: String, CaseIterable {
    case list = "List"
    case grid = "Grid"
}

struct MediaView: View {
    @StateObject private var viewModel = MediaViewModel()
    @State private var selectedViewType: ViewType = .list
    let searchQuery: String
    let mediaType: [String]
    
    var mediaViewWithProgress: some View {
        VStack {
            Divider()
            Picker("View Type", selection: $selectedViewType) {
                ForEach(ViewType.allCases, id: \.self) { viewType in
                    Text(viewType.rawValue).tag(viewType)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .foregroundColor(.white)
            .background(.gray)
            .padding()


            if selectedViewType == .list {
                List {
                    ForEach(Array(viewModel.groupedMediaItems.keys), id: \.self) { key in
                        Section(header: Text(key)
                            .font(.title)
                            .foregroundColor(.white)) {
                                ForEach(viewModel.groupedMediaItems[key] ?? []) { item in
                                    NavigationLink(destination: MediaDetailView(item: item)) {
                                        MediaListViewItem(item: item)
                                    }
                                    .listRowBackground(Color.black) // Set list row background to black
                                }
                            }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black) // Set list background to black
            } else {
                ScrollView {
                    ForEach(Array(viewModel.groupedMediaItems.keys), id: \.self) { key in
                        VStack(alignment: .leading) {
                            Text(key)
                                .font(.title)
                                .padding(.leading)
                                .foregroundColor(.white)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                                ForEach(viewModel.groupedMediaItems[key] ?? []) { item in
                                    NavigationLink(destination: MediaDetailView(item: item)) {
                                        MediaGridViewItem(item: item)
                                    }
                                }
                            }
                        }
                    }
                }
                .background(Color.black) // Set grid background to black
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Set background to black and ignore safe area
        .navigationTitle("Media Search")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.white)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
    }


    var body: some View {
        mediaViewWithProgress.onAppear {
            viewModel.searchMedia(query: searchQuery, mediaQuery: mediaType)
        }
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(searchQuery: "Rahman", mediaType: ["movies, music"])
    }
}
