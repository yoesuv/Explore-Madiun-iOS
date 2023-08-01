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
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "List Place"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
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
    
}


extension ListPlaceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlace", for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        let imgUrl = URL(string: "https://lh3.googleusercontent.com/-VdGBzQkMOZI/VoHY6IZRcTI/AAAAAAAAB6I/V68FY5RlsgQ/s640-Ic42/alun_alun_madiun.jpg")
        cell.imageViewItemPlace.kf.setImage(with: imgUrl)
        cell.labelName.text = "Waduk Widas"
        cell.labelLocation.text = "Kabupaten Madiun"
        return cell
    }
    
}

extension ListPlaceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ListPlaceToDetail", sender: self)
    }
    
}
