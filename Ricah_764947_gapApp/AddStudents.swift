//
//  AddStudents.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class AddStudents: UIViewController {

    @IBOutlet weak var s_id: UITextField!
    @IBOutlet weak var l_name: UITextField!
    @IBOutlet weak var f_name: UITextField!
    var showStudDelegete : show_Student?
    var flag : Bool = false
    var alert : UIAlertController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func save_to_studData(_ sender: Any) {

        let s = Students.init(first_Name: f_name.text!, last_Name: l_name.text!, student_Id: s_id.text!)
      
        for i in Students.student_data{
            
            if s_id.text! == i.student_Id{
                flag = true
                 
                alert = UIAlertController(title: "\(s_id.text!) is in use ", message: "Try new one", preferredStyle: .actionSheet)
                alert?.addAction(UIAlertAction(title: "Student Id Alredy Exists", style: .destructive, handler: nil))
                self.present(alert!, animated: true)
            }
        }
        if !flag{
            
            Students.student_data.append(s)
            
        }
           
            

        s_id.text   = ""
        l_name.text = ""
        f_name.text = ""
        //ReloadView()
        //MARK :reload table of studeentshow
        showStudDelegete?.reloadTable()
    
    }
//
//    func ReloadView()  {
//
//              s_id.text   = ""
//              l_name.text = ""
//              f_name.text = ""
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
