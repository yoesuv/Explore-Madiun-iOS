//
//  AboutChangelogViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 30/07/23.
//

import UIKit

class AboutChangelogViewController: UIViewController {
    
    var pageIndex: Int!
    var listRelease: [ReleaseModel] = []
    
    @IBOutlet weak var tableViewRelease: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listRelease.removeAll()
        listRelease.append(ReleaseModel(id: 1, version: "Version 1.0.0", information: "Lorem Ipsum Dolor Amit"))
        listRelease.append(ReleaseModel(id: 2, version: "Version 1.0.1", information: "Lorem Ipsum Dolor Amit Lorem Ipsum \nDolor Amit Lorem Ipsum Dolor Amit"))
        listRelease.append(ReleaseModel(id: 3, version: "Version 1.0.2", information: "Lorem Ipsum Dolor Amit"))
        
        setupTableRelease()
    }
    
    private func setupTableRelease() {
        let nib = UINib(nibName: "ChangelogCell", bundle: nil)
        self.tableViewRelease.register(nib, forCellReuseIdentifier: ChangelogCell.identifier)
        self.tableViewRelease.separatorInset = .zero
        self.tableViewRelease.layoutMargins = .zero
        self.tableViewRelease.directionalLayoutMargins = .zero
        self.tableViewRelease.showsVerticalScrollIndicator = false
        self.tableViewRelease.estimatedRowHeight = 100
        self.tableViewRelease.rowHeight = UITableView.automaticDimension
        
        self.tableViewRelease.dataSource = self
    }

}

extension AboutChangelogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRelease.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = ChangelogCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? ChangelogCell else {
            return UITableViewCell()
        }
        let data = listRelease[indexPath.row]
        cell.selectionStyle = .none
        cell.labelChangelogVersion.text = data.version
        cell.labelChangelogInformation.text = data.information
        return cell
    }
    
}
