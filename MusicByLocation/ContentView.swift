//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        VStack {
            List {
                ForEach(state.artistNames) { artistData in
                    Link(artistData, destination: URL(string: state.artistLinks[artistData]!) ?? URL(string: "https://itunes.apple.com/search?term=\(artistData)&entity=musicArtist")!)
                }
            }
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
            }).buttonStyle(.bordered)
        }.onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
