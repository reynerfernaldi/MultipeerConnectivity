//
//  DataModel.swift
//  CobaMultiPeer
//
//  Created by Reyner Fernaldi on 16/08/23.
//

import Foundation


struct Menu: Codable {
    var makanan: String
    var quantity: Int
    var id: UUID
    
}

struct Orders: Codable {
    var menus: [Menu]
    var username: String
    var isReady: Bool
    var id: UUID
    
}
