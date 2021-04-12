//
//  NewAnimeListViewController.swift
//  Laboratorio05
//
//  Created by mbtec22 on 10/04/21.
//

import UIKit

class NewAnimeListViewController: UIViewController {

    @IBOutlet weak var txtNameAnime: UITextField!
    
    @IBOutlet weak var txtDescriptionAnime: UITextField!
    
    @IBOutlet weak var switchFavourite: UISwitch!
    
    @IBOutlet weak var btnNew: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNew.layer.cornerRadius = 4.0
    }
    
    @IBAction func New(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let anime = AnimeList(context: context)
        anime.name = txtNameAnime.text!
        anime.descripcion = txtDescriptionAnime.text!
        anime.favourite = switchFavourite.isOn

        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    

}
