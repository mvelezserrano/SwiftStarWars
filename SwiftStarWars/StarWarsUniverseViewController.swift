//
//  StarWarsUniverseViewController.swift
//  SwiftStarWars
//
//  Created by Miguel Angel Vélez Serrano on 13/5/15.
//  Copyright (c) 2015 Miguel Ángel Vélez Serrano. All rights reserved.
//

import UIKit

protocol StarWarsUniverseViewControllerDelegate {
    func starWarsViewController(_ swvc: StarWarsUniverseViewController, didSelectCharacter: StarWarsCharacter)
}

class StarWarsUniverseViewController: UITableViewController {
    
    let imperial_section = 0
    let rebel_section = 1
    
    var model: StarWarsUniverse
    var delegate : StarWarsUniverseViewControllerDelegate?
    
    init (model: StarWarsUniverse) {
        self.model=model
        super.init(nibName: nil, bundle: nil)
        self.title = "StarWars Universe"
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == self.imperial_section) {
            return self.model.imperialsCount()
        } else {
            return self.model.rebelsCount()
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == self.imperial_section) {
            return "Imperials"
        } else {
            return "Rebels"
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Averiguar el modelo (personaje)
        var character: StarWarsCharacter = self.getCharacter(indexPath)
        
        // Crear una celda
        let cellId: String = "StarWarsCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        
        // Configurarla
        cell!.imageView?.image = character.image
        cell!.textLabel?.text = character.alias
        cell!.detailTextLabel?.text = character.name
        
        // Devolverla
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Averiguar el modelo (personaje)
        var character: StarWarsCharacter = self.getCharacter(indexPath)
        
        // Avisamos al delegado
        self.delegate?.starWarsViewController(self, didSelectCharacter: character)
        
        // Enviamos una notificación
        let nc : NSNotificationCenter = NSNotificationCenter.defaultCenter()
        var dict:[String: StarWarsCharacter] = ["character" : character]
        nc.postNotificationName("newCharacterSelected", object: self, userInfo: dict)
        
        // Guardamos en NSUserDefaults el último character seleccionado.
        var def: NSUserDefaults = NSUserDefaults.standardUserDefaults()

        def.setObject(indexPath.section, forKey: "section")
        def.setObject(indexPath.row, forKey: "row")
        def.synchronize()
    }
    
    func getCharacter (indexPath: NSIndexPath) -> StarWarsCharacter {
        
        var character: StarWarsCharacter
        
        if (indexPath.section == self.imperial_section) {
            character = self.model.imperialAtIndex(indexPath.row)
        } else {
            character = self.model.rebelAtIndex(indexPath.row)
        }
        
        return character
    }
}
