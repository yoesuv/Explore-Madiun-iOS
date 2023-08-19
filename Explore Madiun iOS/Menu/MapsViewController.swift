//
//  MapsViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapsViewController: UIViewController, GMSMapViewDelegate {
    
    private var mapView: GMSMapView!
    private let service = NetworkService()
    private var pins:[PinModel] = []
    
    private let locationManager = CLLocationManager()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Maps"
        let reload = UIBarButtonItem(image: UIImage(systemName: "repeat.circle"), style: .plain, target: self, action: #selector(reloadMaps))
        self.tabBarController?.navigationItem.rightBarButtonItems = [reload]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.navigationItem.setRightBarButton(nil, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        checkServiceLocation()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -7.689211, longitude: 111.345548, zoom: 9)
        self.mapView = GMSMapView(frame: .zero, camera: camera)
        self.mapView.settings.compassButton = true
        self.mapView.delegate = self
        self.view = mapView
    }
    
    @objc private func reloadMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: -7.689211, longitude: 111.345548, zoom: 9)
        self.mapView.animate(to: camera)
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
    
    private func checkServiceLocation() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.setupPermissionLocation()
            }
        }
    }
    
    private func setupPermissionLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("MapsViewController # DENIED or RESTRICTED")
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            print("MapsViewController # DEFAULT")
        }
    }

}

extension MapsViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.checkServiceLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lng = location.coordinate.longitude
            print("MapsViewController # \(lat),\(lng)")
        }
    }
    
}
