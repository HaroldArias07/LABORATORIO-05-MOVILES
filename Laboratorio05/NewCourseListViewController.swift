//
//  NewCourseListViewController.swift
//  Laboratorio05
//
//  Created by mbtec22 on 11/04/21.
//

import UIKit

class NewCourseListViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var inputNotaTeoria: UITextField!
    
    @IBOutlet weak var inputNotaLaboratorio: UITextField!
    
    @IBOutlet weak var inputNotaExamen: UITextField!
    
    @IBOutlet weak var inputTeacher: UITextField!
    
    @IBOutlet weak var btnNew: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNew.layer.cornerRadius = 4.0
    }
    
    @IBAction func New(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let course = CourseList(context: context)
        course.name = inputName.text!
        course.teoria = Float(inputNotaTeoria.text!)!
        course.laboratorio = Float(inputNotaLaboratorio.text!)!
        course.examen = Float(inputNotaExamen.text!)!
        course.teacher = inputTeacher.text!
        course.averrage = (Float(inputNotaTeoria.text!)! * 0.20) + (Float(inputNotaLaboratorio.text!)! * 0.40) + (Float(inputNotaExamen.text!)! * 0.40)

        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }

}
