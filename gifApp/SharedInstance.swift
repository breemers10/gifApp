//
//  SharedInstance.swift
//  gifApp
//
//  Created by Kristaps Brēmers on 27.04.19.
//  Copyright © 2019. g. Chili. All rights reserved.
//

import UIKit

class SharedInstance {
    
    static let instance = SharedInstance()
    var gifArray = [String]()
    var onDataCompletion: (() -> Void)?
}
