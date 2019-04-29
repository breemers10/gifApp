//
//  StartViewController.swift
//  gifApp
//
//  Created by Kristaps Brēmers on 16.04.19.
//  Copyright © 2019. g. Chili. All rights reserved.
//

import UIKit
import SwiftyGif

class StartViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://media.giphy.com/media/3oEjHOWlyBm3IE1p7O/giphy.gif")
        imageView.setGifFromURL(url)
    }
}
