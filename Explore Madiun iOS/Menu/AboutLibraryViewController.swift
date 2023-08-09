//
//  AboutLibraryViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 30/07/23.
//

import UIKit

class AboutLibraryViewController: UIViewController {
    
    var pageIndex: Int!
    private var listLibrary:[LibraryModel] = []
    
    @IBOutlet weak var tableViewLibrary: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listLibrary.removeAll()
        self.listLibrary.append(LibraryModel(id: 1, name: "Alamofire", link: "https://cocoapods.org/pods/Alamofire", license: Constants.licenseMit))
        self.listLibrary.append(LibraryModel(id: 2, name: "Kingfisher", link: "https://cocoapods.org/pods/Kingfisher", license: Constants.licenseMit))
        self.listLibrary.append(LibraryModel(id: 3, name: "Lorem Ipsum", link: "https://cocoapods.org/pods/Kingfisher", license: Constants.licenseMit))
        
        setupTableLibrary()
    }
    
    private func setupTableLibrary() {
        let nib = UINib(nibName: "LibraryCell", bundle: nil)
        self.tableViewLibrary.register(nib, forCellReuseIdentifier: LibraryCell.identifier)
        self.tableViewLibrary.separatorInset = .zero
        self.tableViewLibrary.layoutMargins = .zero
        self.tableViewLibrary.directionalLayoutMargins = .zero
        self.tableViewLibrary.showsVerticalScrollIndicator = false
        self.tableViewLibrary.estimatedRowHeight = 50
        self.tableViewLibrary.rowHeight = UITableView.automaticDimension
        
        self.tableViewLibrary.dataSource = self
    }

}

extension AboutLibraryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLibrary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = LibraryCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? LibraryCell else {
            return UITableViewCell()
        }
        let data = listLibrary[indexPath.row]
        cell.selectionStyle = .none
        cell.labelLibraryName.text = data.name
        cell.labelLibraryLicense.text = data.license
        cell.labelLibraryLink.text = data.link
        return cell
    }
    
}
