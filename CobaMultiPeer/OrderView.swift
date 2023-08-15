//
//  OrderView.swift
//  CobaMultiPeer
//
//  Created by Reyner Fernaldi on 13/08/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
//    @State private var orders: [Menu] = []
    var body: some View {
        
        VStack{
            List{
                ForEach(rpsSession.orders, id: \.id) { menu in
                    Text("ID: \(menu.username)")
                        ForEach(menu.menus, id: \.id) { i in
                            HStack{
                                Text("Menu: \(i.makanan)")
                                Text("Qty: \(i.quantity)")
                            }
                    }
                    .padding()
                }
            }
            Button("Send Menu") {
                let menu = Orders(menus: [Menu(makanan: "Nasi Goreng", quantity: 2, id: UUID()),
                                          Menu(makanan: "Nasi Pecel", quantity: 4, id: UUID())], username: rpsSession.username, id: UUID())
                rpsSession.send(menu: menu)
//                orders.append(menu) // Tambahkan menu ke daftar yang dipesan
            }
        }
//        List{
//            cart
//        }
//        .onReceive(rpsSession.$receivedMenu.receive(on: DispatchQueue.main)) { receivedMenus in
//            orders.append(contentsOf: receivedMenus) // Tambahkan menu yang diterima ke daftar yang dipesan
//        }
    }
    
    var cart: some View {
        VStack {
//            List {
//                ForEach(rpsSession.receivedMenus, id: \.id) { menu in
//                    VStack(alignment: .leading) {
//                        Text("Menu: \(menu.makanan)")
//                        Text("Qty: \(menu.quantity)")
//                    }
//                    .padding()
//                }
//            }
            
            Button("Send Menu") {
                let menu = Menu(makanan: "Nasi Goreng", quantity: 2, id: UUID())
//                rpsSession.send(menu: menu)
//                orders.append(menu) // Tambahkan menu ke daftar yang dipesan
            }
        }
//        .onReceive(rpsSession.$receivedMenu.receive(on: DispatchQueue.main)) { receivedMenu in
//            if let receivedMenu = receivedMenu {
//                orders.append(receivedMenu) // Tambahkan menu yang diterima ke daftar yang dipesan
//            }
//        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
