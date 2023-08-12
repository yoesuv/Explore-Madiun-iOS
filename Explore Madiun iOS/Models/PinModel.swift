//
//  PinModel.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 11/08/23.
//

import Foundation

struct PinModel: Codable, Identifiable {
    var id: String {
        return name!
    }
    let name: String?
    let lokasi: Int?
    let latitude: Double?
    let longitude: Double?
}
