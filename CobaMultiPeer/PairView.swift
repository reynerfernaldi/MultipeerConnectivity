//
//  PairView.swift
//  CobaMultiPeer
//
//  Created by Reyner Fernaldi on 13/08/23.
//


import SwiftUI
import os

struct PairView: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession

    @Binding var currentView: Int
    var logger = Logger()

    var body: some View {
        if (!rpsSession.paired) {
            HStack {
                List(rpsSession.availablePeers, id: \.self) { peer in
                    Button(peer.displayName) {
                        rpsSession.serviceBrowser.invitePeer(peer, to: rpsSession.session, withContext: nil, timeout: 30)
                    }
                }
            }
            .alert("Received an invite from \(rpsSession.recvdInviteFrom?.displayName ?? "ERR")!", isPresented: $rpsSession.recvdInvite) {
                Button("Accept invite") {
                    if (rpsSession.invitationHandler != nil) {
                        rpsSession.invitationHandler!(true, rpsSession.session)
                    }
                }
                Button("Reject invite") {
                    if (rpsSession.invitationHandler != nil) {
                        rpsSession.invitationHandler!(false, nil)
                    }
                }
            }
        } else {
            OrderView()
//                .environmentObject(rpsSession)
//            GameView(currentView: $currentView)
//                .environmentObject(rpsSession)
        }
    }
}

//struct PairView_Previews: PreviewProvider {
//    static var previews: some View {
//        PairView(currentView: 1)
//    }
//}
