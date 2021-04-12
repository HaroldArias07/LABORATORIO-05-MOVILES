//
//  DetailCourseViewController.swift
//  Laboratorio05
//
//  Created by mbtec22 on 11/04/21.
//

import UIKit

class DetailCourseViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTeacher: UILabel!
    
    @IBOutlet weak var lblTeoria: UILabel!
    
    @IBOutlet weak var lblLaboratorio: UILabel!
    
    @IBOutlet weak var lblAverrage: UILabel!
    
    @IBOutlet weak var lblExamen: UILabel!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var viewTeoria: UIView!
    
    @IBOutlet weak var viewLaboratorio: UIView!
    
    @IBOutlet weak var viewExamen: UIView!
    
    @IBOutlet weak var viewAverrage: UIView!
    
    var course : CourseList? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnDelete.layer.cornerRadius = 4.0
        
        lblName.text = course!.name!
        lblTeacher.text = course!.teacher!
        lblTeoria.text = String(course!.teoria)
        lblLaboratorio.text = String(course!.laboratorio)
        lblExamen.text = String(course!.examen)
        lblAverrage.text = String(course!.averrage)
        
        if course!.teoria > 13 {
            viewTeoria.backgroundColor = #colorLiteral(red: 0.2820823274, green: 1, blue: 0.2620222003, alpha: 0.35)
        } else {
            viewTeoria.backgroundColor = #colorLiteral(red: 1, green: 0.1695615325, blue: 0.05765818526, alpha: 0.35)
        }
        
        if course!.laboratorio > 13 {
            viewLaboratorio.backgroundColor = #colorLiteral(red: 0.2820823274, green: 1, blue: 0.2620222003, alpha: 0.35)
        } else {
            viewLaboratorio.backgroundColor = #colorLiteral(red: 1, green: 0.1695615325, blue: 0.05765818526, alpha: 0.35)
        }
        
        if course!.examen > 13 {
            viewExamen.backgroundColor = #colorLiteral(red: 0.2820823274, green: 1, blue: 0.2620222003, alpha: 0.35)
        } else {
            viewExamen.backgroundColor = #colorLiteral(red: 1, green: 0.1695615325, blue: 0.05765818526, alpha: 0.35)
        }
        
        if course!.averrage > 13 {
            viewAverrage.backgroundColor = #colorLiteral(red: 0.2820823274, green: 1, blue: 0.2620222003, alpha: 0.35)
        } else {
            viewAverrage.backgroundColor = #colorLiteral(red: 1, green: 0.1695615325, blue: 0.05765818526, alpha: 0.35)
        }
        
    }
    
    @IBAction func CompletedCourse(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(course!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }


}
