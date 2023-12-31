//
//  KitchenView.swift
//  CobaMultiPeer
//
//  Created by Reyner Fernaldi on 15/08/23.
//

import SwiftUI
import os

struct KitchenView: View {
//    @State var orderData: [Orders] = []
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    var body: some View {
        VStack{
            List{
                ForEach(rpsSession.orders, id: \.id) { order in
                    HStack{
                        VStack(alignment: .leading){
                            Text("ID: \(order.username)")
                            Text("Status: \(order.isReady)" as String)
                            ForEach(order.menus, id: \.id) { i in
                                HStack{
                                    Text("Menu: \(i.makanan)")
                                    Text("Qty: \(i.quantity)")
                                }
                            }
                        }
                        Button(action: {
                            if let index = rpsSession.orders.firstIndex(where: { $0.id == order.id }) {
                                rpsSession.orders[index].isReady = true
                                rpsSession.send(menu: rpsSession.orders[index])
                                
                                NotificationCenter.default.post(name: Notification.Name("IsReadyChanged"), object: nil)
                                    
//                                let orderReady = Orders(menus: [], username: rpsSession.username, isReady: true, id: order.id)
//                                rpsSession.send(menu: orderReady)
                            }
                        }) {
                            Text("Done")
                        }
                    }
                }
                
                
            }
//            .onChange(of: rpsSession.orders) { newValue in
//                print("Keganti")
//            }
//            .onReceive(rpsSession.$orders) { receivedMenus in
//                orderData.removeAll()
//                orderData.append(contentsOf: receivedMenus) // Tambahkan menu yang diterima ke daftar yang dipesan
//                print("Ini isi order data", orderData)
//            }
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
        }.task {
            rpsSession.serviceAdvertiser.startAdvertisingPeer()
        }
    }
}

struct KitchenView_Previews: PreviewProvider {
    static var previews: some View {
        KitchenView()
    }
}
