//
//  GifCollectionViewCell.swift
//  gifApp
//
//  Created by Kristaps Brēmers on 17.04.19.
//  Copyright © 2019. g. Chili. All rights reserved.
//

import UIKit
import Kingfisher

class GifCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(imageUrl: String) {
        let url = URL(string: imageUrl)
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        
        clearCache()
    }
    
    func clearCache() {
        let cache = ImageCache.default

        cache.clearMemoryCache()
        cache.clearDiskCache()
    }
    
    func cancelDownloading() {
        imageView.kf.cancelDownloadTask()
    }
    
    func startAnimation() {
        imageView.startAnimatingGif()
    }
    
    func stopAnimation() {
        imageView.stopAnimatingGif()
    }
}
