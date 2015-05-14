//
//  StarWarsCharacter.swift
//  SwiftStarWars
//
//  Created by Miguel Angel Vélez Serrano on 11/5/15.
//  Copyright (c) 2015 Miguel Ángel Vélez Serrano. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter {
    var name: String = ""
    var alias: String? = ""
    var image: UIImage?
    var sound: NSData?
    var url: NSURL?
    
    init() {}
    
    init(name:String, alias:String, image:UIImage?, sound:NSData?, url:NSURL?) {
        self.name = name
        self.alias = alias
        self.image = image
        self.sound = sound
        self.url = url
    }
    
    init(alias:String, image:UIImage?, sound:NSData?, url:NSURL?) {
        self.name = ""
        self.alias = alias
        self.image = image
        self.sound = sound
        self.url = url
    }
    
}
