//
//  TableViewController.swift
//  Laboratorio05
//
//  Created by mbtec22 on 10/04/21.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var animeList:[AnimeList] = []
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerAnimes()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        let list = animeList[indexPath.row]
        
        if list.favourite{
            cell.textLabel?.text = "⭐️ \(list.name!)"
            cell.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.9875990133, alpha: 0.2585034014)
        } else {
            cell.textLabel?.text = list.name!
           
        }
        
        cell.detailTextLabel?.text = "Descripción: \(list.descripcion!)"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeList.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let anime = animeList[indexPath.row]
        performSegue(withIdentifier: "selectAnimeSegue", sender: anime)
    }
    
   
    @IBAction func NewAnime(_ sender: Any) {
        performSegue(withIdentifier: "newSegue", sender: nil)
    }
    
    func obtenerAnimes() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            animeList = try context.fetch(AnimeList.fetchRequest()) as! [AnimeList]
        } catch {
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectAnimeSegue" {
            let nextVC = segue.destination as! AnimeCompletedViewController
            nextVC.anime = sender as? AnimeList
        }
    
    }
    
}
