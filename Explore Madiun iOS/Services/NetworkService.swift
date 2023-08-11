//
//  NetworkService.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 11/08/23.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchPlaces(result: @escaping (DataResponse<[PlaceModel], AFError>) -> Void) {
        AF.request("https://info-madiun.firebaseapp.com/List_place.json", method: .get)
            .responseDecodable(of: [PlaceModel].self) { response in
                result(response)
            }
    }
    
    func fetchGalleries(result: @escaping (DataResponse<[GalleryModel], AFError>) -> Void) {
        AF.request("https://info-madiun.firebaseapp.com/Gallery_info.json", method: .get)
            .responseDecodable(of: [GalleryModel].self) { response in
                result(response)
            }
    }
    
    func fetchPins(result: @escaping (DataResponse<[PinModel], AFError>) -> Void) {
        AF.request("https://info-madiun.firebaseapp.com/maps_info.json", method: .get)
            .responseDecodable(of: [PinModel].self) { response in
                result(response)
            }
    }
    
}
