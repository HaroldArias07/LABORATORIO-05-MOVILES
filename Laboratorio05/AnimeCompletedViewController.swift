//
//  AnimeCompletedViewController.swift
//  Laboratorio05
//
//  Created by mbtec22 on 10/04/21.
//

import UIKit

class AnimeCompletedViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblFavourite: UILabel!
    
    @IBOutlet weak var btnCompleted: UIButton!
    
    var anime : AnimeList? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnCompleted.layer.cornerRadius = 4.0
        
        if anime!.favourite {
            lblName.text = "⭐️ \(anime!.name!)"
            lblDescription.text = anime!.descripcion!
            lblFavourite.text = "✅"
        } else {
            lblName.text = anime!.name!
            lblDescription.text = anime!.descripcion!
            lblFavourite.text = "❌"
        }
        
    }
    
    @IBAction func CompletedAnime(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(anime!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }

}
