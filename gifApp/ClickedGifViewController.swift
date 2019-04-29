//
//  ClickedGifViewController.swift
//  gifApp
//
//  Created by Kristaps Brēmers on 27.04.19.
//  Copyright © 2019. g. Chili. All rights reserved.
//

import UIKit

class ClickedGifViewController: UIViewController {
    
    var viewModel: ClickedGifViewModel?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//            let imageUrl = URL(string: SharedInstance.instance.gifArray[(viewModel?.index)!] )
//            self.imageView.kf.setImage(with: imageUrl)

    }
}
