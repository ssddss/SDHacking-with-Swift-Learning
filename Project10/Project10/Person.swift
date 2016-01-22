//
//  Person.swift
//  Project10
//
//  Created by yurongde on 16/1/22.
//  Copyright © 2016年 yurongde. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String,image: String) {
        self.name = name
        self.image = image
    }
}
