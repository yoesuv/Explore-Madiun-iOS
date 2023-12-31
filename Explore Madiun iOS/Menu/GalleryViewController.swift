//
//  GalleryViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit
import Kingfisher

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionViewGallery: UICollectionView!
    
    let layout = UICollectionViewFlowLayout()
    private let service = NetworkService()
    private var galleries: [GalleryModel] = []
    private var gallery: GalleryModel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GalleryToDetail" {
            if let detailViewController = segue.destination as? DetailGalleryViewController {
                detailViewController.gallery = gallery
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Gallery"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        requestData()
    }
    
    private func setupCollectionView() {
        let myNib = UINib(nibName: "GalleryCell", bundle: nil)
        self.collectionViewGallery.register(myNib, forCellWithReuseIdentifier: GalleryCell.identifier)
        
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero
        layout.sectionInset = .zero
        self.collectionViewGallery.collectionViewLayout = layout
        
        self.collectionViewGallery.dataSource = self
        self.collectionViewGallery.delegate = self
        self.collectionViewGallery.showsVerticalScrollIndicator = false
    }
    
    private func requestData() {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view, text: "Loading Gallery")
        service.fetchGalleries(result: { response in
            LoadingOverlay.shared.hideOverlayView()
            self.galleries.removeAll()
            if response.error == nil {
                self.galleries = response.value ?? []
            }
            self.collectionViewGallery.reloadData()
        })
    }

}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.gallery = galleries[indexPath.row]
        self.performSegue(withIdentifier: "GalleryToDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = layout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let cellWidth = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: cellWidth , height: cellWidth)
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.identifier, for: indexPath) as? GalleryCell else {
            return UICollectionViewCell()
        }
        let data = galleries[indexPath.row]
        let imgUrl = URL(string: data.thumbnail ?? "")
        cell.imageViewGallery.kf.setImage(with: imgUrl, placeholder: UIImage(named: "ImagePlaceholder"))
        return cell
    }
}
