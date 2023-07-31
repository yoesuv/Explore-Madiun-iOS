//
//  MapsViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController, GMSMapViewDelegate {
    
    private var mapView: GMSMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Maps"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -7.720012, longitude: 111.449379, zoom: 9)
        mapView = GMSMapView(frame: .zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
    }

}
