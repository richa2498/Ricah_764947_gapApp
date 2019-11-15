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
    var alert2 : UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func save_to_studData(_ sender: Any) {
     if f_name.text! == "" && l_name.text! == "" && s_id.text! == ""{
               alert = UIAlertController(title: "You cant leave empty fields ", message: "add in each field", preferredStyle: .alert)
                alert?.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
                  self.present(alert!, animated: true)
               
           }else{
        let name = f_name.text!
        print(name)
                   alert = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .actionSheet)
                   alert?.addAction(UIAlertAction(title: "Yes I am sure!", style: .default, handler: { (act) in
                        
                            self.append_stud_data()
                            self.alert2 = UIAlertController(title: "New Contact Saved", message: "\(name) is now a student.", preferredStyle: .actionSheet)
                            self.alert2?.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                            self.present(self.alert2!, animated: true)
                    self.ReloadView()
                    self.showStudDelegete?.reloadTable()
                          
                   }))
        alert?.addAction(UIAlertAction(title: "No WAT", style: .destructive, handler: { (ACTIONS) in
            self.ReloadView()
        }))
        
        self.present(alert!, animated: true)
        //MARK :reload table of studeentshow
        
    
    }
    }
    func ReloadView()  {

              s_id.text   = ""
              l_name.text = ""
              f_name.text = ""
    }
    
    func append_stud_data(){
      
      
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
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
