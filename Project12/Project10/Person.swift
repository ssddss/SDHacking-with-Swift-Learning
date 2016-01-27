//
//  Person.swift
//  Project10
//
//  Created by yurongde on 16/1/22.
//  Copyright © 2016年 yurongde. All rights reserved.
//

import UIKit

class Person: NSObject,NSCoding {
    var name: String
    var image: String
    
    init(name: String,image: String) {
        self.name = name
        self.image = image
    }
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        image = aDecoder.decodeObjectForKey("image") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
     aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(image, forKey: "image")
    }
}
