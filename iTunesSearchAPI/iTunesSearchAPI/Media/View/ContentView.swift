//
//  ContentView.swift
//  iTunesSearchAPI
//
//  Created by Vishnu on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    // @StateObject private var viewModel = MediaViewModel()
    @State private var searchQuery = ""
    @State private var isMediaViewPresented: Bool = false
    @State private var selectedValues:[String] = []
    @State private var isShowingMediaListView: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "apple.logo")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    Text("iTunes")
                        .foregroundColor(.white)
                }
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity, alignment: .center)

                Text("Search for a variety of content from the itunes store including iBooks, Movies, podcast, music, music videos and audiobooks")
                    .foregroundColor(.white)
                TextField("Search for media", text: $searchQuery, onCommit: {
                    //viewModel.searchMedia(query: searchQuery)

                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 24)

                Text("Specify the content for the parameter to be searched")
                    .foregroundColor(.white)

                TextField("Select Media type", text: Binding(
                    get: {
                        selectedValues.joined(separator: ", ")
                    },
                    set: { _ in }
                ))
                .foregroundColor(.black)
                .padding(.vertical, 24)
                .background(.white)
                NavigationLink(destination: MediaListView(selectedValues: $selectedValues)) {
                    Text("Select Media type you want to view")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding(.vertical, 16)


                Button(action: {
                    if !selectedValues.isEmpty {
                        isMediaViewPresented = true
                    }
                }, label: {
                    Text("Submit")
                        .foregroundColor(.white)

                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(.gray)
                })
                .background(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isMediaViewPresented, destination: {
                MediaView(searchQuery: searchQuery, mediaType: selectedValues) })
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
