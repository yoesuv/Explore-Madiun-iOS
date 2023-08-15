//
//  ListPlaceViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit
import Kingfisher

class ListPlaceViewController: UIViewController {
    
    @IBOutlet weak var tableViewListPlace: UITableView!
    
    private let service = NetworkService()
    private var listPlace: [PlaceModel] = []
    private var placeModel: PlaceModel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListPlaceToDetail" {
            if let detailViewController = segue.destination as? DetailPlaceViewController {
                detailViewController.place = placeModel
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "List Place"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        requestData()
    }
    
    private func setupTableView() {
        tableViewListPlace.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "CellPlace")
        tableViewListPlace.separatorInset = .zero
        tableViewListPlace.layoutMargins = .zero
        tableViewListPlace.directionalLayoutMargins = .zero
        tableViewListPlace.rowHeight = 175
        tableViewListPlace.showsVerticalScrollIndicator = false
        
        tableViewListPlace.dataSource = self
        tableViewListPlace.delegate = self
    }
    
    private func requestData() {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view, text: "Loading List Place")
        service.fetchPlaces(result: { response in
            LoadingOverlay.shared.hideOverlayView()
            self.listPlace.removeAll()
            if response.error == nil {
                self.listPlace = response.value ?? []
            }
            self.tableViewListPlace.reloadData()
         })
    }
    
}


extension ListPlaceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlace", for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        let dt = listPlace[indexPath.row]
        let imgUrl = URL(string: dt.gambar ?? "")
        cell.imageViewItemPlace.kf.setImage(with: imgUrl, placeholder: UIImage(named: "ImagePlaceholder"))
        cell.labelName.text = dt.nama
        cell.labelLocation.text = dt.lokasi
        return cell
    }
    
}

extension ListPlaceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.placeModel = listPlace[indexPath.row]
        self.performSegue(withIdentifier: "ListPlaceToDetail", sender: self)
    }
    
}
