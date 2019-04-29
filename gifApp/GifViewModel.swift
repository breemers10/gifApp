//
//  GifViewModel.swift
//  gifApp
//
//  Created by Kristaps Brēmers on 17.04.19.
//  Copyright © 2019. g. Chili. All rights reserved.
//

import UIKit
import SwiftyGif
import GiphyCoreSDK

class GifViewModel {
    
    init() {
        GiphyCore.configure(apiKey: "2GviUHDQh97tkrXXB2jdRtPrXteeJuH1")
        getGif()
    }
    
    func searchGif(search: String, with completionHandler: @escaping (Bool) -> Void) {
        GiphyCore.shared.search(search, media: .gif, offset: 2, limit: 100, rating: .ratedG, lang: .english, completionHandler: { (response, error) in
            SharedInstance.instance.gifArray = []
            if let error = error {
                print("error in response", error)
            }
            guard
                let data = response?.data else { return }
            
            if data.isEmpty {
                completionHandler(true)
                return
            }
            
            completionHandler(false)
                
            for results in data {
                guard let newGif = results.images?.fixedWidthDownsampled?.gifUrl else { return }
                SharedInstance.instance.gifArray.append(newGif)
            }
            
            SharedInstance.instance.onDataCompletion?()
        })
    }
    
    func getGif() {
        GiphyCore.shared.trending(.gif, limit: 100) { (response, error) in
            SharedInstance.instance.gifArray = []
            
            guard
                error == nil,
                let data = response?.data
                else { return }
            
            for results in data {
                if let gif = results.images?.fixedWidthDownsampled?.gifUrl {
                    SharedInstance.instance.gifArray.append(gif)
                }
            }
            SharedInstance.instance.onDataCompletion?()
        }
    }
}
