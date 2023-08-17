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
    private let service = NetworkService()
    private var pins:[PinModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Maps"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -7.689211, longitude: 111.345548, zoom: 9)
        self.mapView = GMSMapView(frame: .zero, camera: camera)
        self.mapView.settings.compassButton = true
        self.mapView.delegate = self
        self.view = mapView
    }
    
    
    private func requestData() {
        self.mapView.clear()
        service.fetchPins(result: {response in
            self.pins.removeAll()
            if response.error == nil {
                self.pins = response.value ?? []
                self.showMarkers()
            }
        })
    }
    
    private func showMarkers() {
        for pin in pins {
            let marker = GMSMarker()
            let locationLatLng = CLLocationCoordinate2D(latitude: pin.latitude ?? 0, longitude: pin.longitude ?? 0)
            marker.icon = GMSMarker.markerImage(with: UIColor(named: "Primary")!)
            marker.position = locationLatLng
            marker.title = pin.name
            marker.map = self.mapView
        }
    }

}
