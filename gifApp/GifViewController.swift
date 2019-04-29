//
//  GifViewController.swift
//  gifApp
//
//  Created by Kristaps Brēmers on 16.04.19.
//  Copyright © 2019. g. Chili. All rights reserved.
//

import UIKit

class GifViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var indx: Int?
    var viewModel = GifViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchBar.delegate = self
        
        SharedInstance.instance.onDataCompletion = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SharedInstance.instance.gifArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gifCell", for: indexPath)
        if let myCell = cell as? GifCollectionViewCell {
                myCell.configure(imageUrl: SharedInstance.instance.gifArray[indexPath.row])
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? GifCollectionViewCell)?.cancelDownloading()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            viewModel.getGif()
            return
        }
        viewModel.searchGif(search: searchText) { (isKeywordFound) in
            if !isKeywordFound {
                print("cool")
            } else {
                print("naah homie")
            }
        }
    }
}
