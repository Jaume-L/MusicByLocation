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
        let names = artists?.map { return $0.name + ", " + ($0.genre ?? "") }
        
        DispatchQueue.main.async {
            self.artistNames = names ?? ["Error finding Artists from your location"]
        }
    }
    
}
