//
//  StarWarsUniverse.swift
//  SwiftStarWars
//
//  Created by Miguel Angel Vélez Serrano on 13/5/15.
//  Copyright (c) 2015 Miguel Ángel Vélez Serrano. All rights reserved.
//

import Foundation
import UIKit

class StarWarsUniverse {
    
    var rebels = [StarWarsCharacter]()
    var imperials = [StarWarsCharacter]()
    
    init() {

        var vader = StarWarsCharacter(name: "Anakin Skywalker",
            alias: "Darth Vader",
            image: UIImage(named: "darthVader.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("vader", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")!)
        
        self.imperials.append(vader)
        
        var tarkin = StarWarsCharacter(name: "Wilhuf Tarkin",
            alias: "Grand Moff Tarkin",
            image: UIImage(named: "tarkin.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("tarkin", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin")!)
        
        self.imperials.append(tarkin)
        
        var palpatine = StarWarsCharacter(name: "Palpatine",
            alias: "Darth Sidious",
            image: UIImage(named: "palpatine.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("palpatine", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/Palpatine")!)
        
        self.imperials.append(palpatine)
        
        var chewie = StarWarsCharacter(alias: "chewbacca",
            image: UIImage(named: "chewbacca.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chewbacca", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")!)
        
        self.rebels.append(chewie)
        
        var c3po = StarWarsCharacter(alias: "C-3PO",
            image: UIImage(named: "c3po.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c3po", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")!)
        
        self.rebels.append(c3po)
        
        var yoda = StarWarsCharacter(name: "Minch Yoda",
            alias: "Master Yoda",
            image: UIImage(named: "yoda.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("yoda", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/Yoda")!)
        
        self.rebels.append(yoda)
        
        var r2d2 = StarWarsCharacter(alias: "R2-D2",
            image: UIImage(named: "R2-D2.jpg")!,
            sound: NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("r2-d2", ofType: "caf")!)!),
            url: NSURL(string: "http://en.wikipedia.org/wiki/R2-D2")!)
        
        self.rebels.append(r2d2)
        
    }
    
    func rebelsCount() -> Int{
        
        return rebels.count
    }
    
    func imperialsCount() -> Int{
        
        return imperials.count;
    }
    
    func rebelAtIndex(var index : Int) -> StarWarsCharacter{
        
        return rebels[index]
        
    }
    
    func imperialAtIndex(var index : Int) -> StarWarsCharacter{
        
        return imperials[index];
        
    }
}