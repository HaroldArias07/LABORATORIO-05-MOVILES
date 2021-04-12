//
//  CoursesTableViewController.swift
//  Laboratorio05
//
//  Created by mbtec22 on 11/04/21.
//

import UIKit

class CoursesTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var courseList:[CourseList] = []
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCourses()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        let list = courseList[indexPath.row]
        
        if list.averrage < 13{
            cell.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.02479779215, alpha: 0.45)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.9875990133, alpha: 0.2585034014)
        }
        cell.textLabel?.text = list.name!
        cell.detailTextLabel?.text = "Profesor: \(list.teacher!) - Promedio: \(list.averrage)"
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
   
    @IBAction func NewCourse(_ sender: Any) {
        performSegue(withIdentifier: "newCourseSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courseList[indexPath.row]
        performSegue(withIdentifier: "selectCourseSegue", sender: course)
    }
    
    func obtenerCourses() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            courseList = try context.fetch(CourseList.fetchRequest()) as! [CourseList]
        } catch {
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectCourseSegue" {
            let nextVC = segue.destination as! DetailCourseViewController
            nextVC.course = sender as? CourseList
        }
     }


}
