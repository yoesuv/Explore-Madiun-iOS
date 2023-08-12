//
//  GalleryModel.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 11/08/23.
//

import Foundation

struct GalleryModel: Codable, Identifiable {
    var id: String {
        return caption!
    }
    let caption: String?
    let thumbnail: String?
    let image: String?
}
