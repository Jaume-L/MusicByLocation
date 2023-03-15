//
//  StateController.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 03/03/2023.
//

import Foundation

class StateController: ObservableObject {
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    @Published var artistNames: [String] = [""]
    @Published var artistLinks: [String:String] = ["":""]
    
    var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: [Artist]?) {
        let names = artists?.map { return $0.name + ", "  + ($0.genre ?? "") }
        let links = artists?.map { return ($0.link ?? "https://itunes.apple.com/search?term=\($0.name)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) } ?? ["https://itunes.apple.com/search?term=Dan%20England&entity=musicArtist"]
        
        DispatchQueue.main.async {
            self.artistNames = names ?? ["Error finding Artists from your location"]
            for i in 0..<links.count {
                let key = self.artistNames[i]
                self.artistLinks[key] = links[i]
            }
            
        }
    }
    
}
