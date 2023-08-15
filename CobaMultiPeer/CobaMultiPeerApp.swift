//
//  CobaMultiPeerApp.swift
//  CobaMultiPeer
//
//  Created by Reyner Fernaldi on 09/08/23.
//

import SwiftUI

@main
struct CobaMultiPeerApp: App {
//    @StateObject var rpsSession = RPSMultipeerSession(username: "YourUsername") // Inisialisasi RPSMultipeerSession
    var body: some Scene {
        WindowGroup {
            StartView()
//                .environmentObject(rpsSession)
        }
    }
}
