//
//  CharacterViewController.swift
//  SwiftStarWars
//
//  Created by Miguel Angel Vélez Serrano on 12/5/15.
//  Copyright (c) 2015 Miguel Ángel Vélez Serrano. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController, StarWarsUniverseViewControllerDelegate, UISplitViewControllerDelegate {
    
    var model: StarWarsCharacter
    var player = AVAudioPlayer()
    
    init (model: StarWarsCharacter) {
        self.model=model
        super.init(nibName: "CharacterViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBAction func playSound(sender: AnyObject) {
        
        var error:NSError?
        player = AVAudioPlayer(data: self.model.sound, error: &error)
        
        player.prepareToPlay()
        player.play()
        
    }
    
    @IBAction func showWiki(sender: AnyObject) {
        var wVC = WikiViewController(model: self.model)
        self.navigationController?.pushViewController(wVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.syncViewToModel()
    }
    
    func syncViewToModel() {
        self.title = model.alias
        characterImage.image = model.image
    }
    
    // MARK: - StarWarsUniverseViewControllerDelegate
    func starWarsViewController(_ swvc: StarWarsUniverseViewController, didSelectCharacter: StarWarsCharacter) {
        
        //Actualizamos el modelo
        self.model = didSelectCharacter
        
        // Sincronizamos vista --> modelo
        self.syncViewToModel()
    }
    
    // MARK: - UISplitViewControllerDelegate
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        if (displayMode == UISplitViewControllerDisplayMode.PrimaryHidden) {
            // La tabla está oculta y colgamos el botón
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
        } else {
            // La tabla se muestra y oculto el botón
            self.navigationItem.leftBarButtonItem=nil
        }
    }

    

}
