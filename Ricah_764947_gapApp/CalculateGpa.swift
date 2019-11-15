//
//  CalculateGpa.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CalculateGpa: UIViewController {

    @IBOutlet weak var course1: UILabel!
    @IBOutlet weak var course2: UILabel!
    @IBOutlet weak var course3: UILabel!
    @IBOutlet weak var course4: UILabel!
    @IBOutlet weak var course5: UILabel!
    
    @IBOutlet weak var course1_txt: UITextField!
    @IBOutlet weak var course2_txt: UITextField!
    @IBOutlet weak var course3_txt: UITextField!
    @IBOutlet weak var course4_txt: UITextField!
    @IBOutlet weak var course5_txt: UITextField!
    
    var semChooseDelegate : SemChooseViewController?
    var alert : UIAlertController?
    var student_grades : [Double] = []
    var total : Double = 0
    var stud_final_gpa : Double = 0.0
    var index : Int = -1
    @IBOutlet weak var cgpa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        index = semChooseDelegate!.index
        print(semChooseDelegate?.semName)
        
        switch semChooseDelegate?.semName {
        case "sem1" :
                course1.text? = Semester.sem1[0]
                course2.text? = Semester.sem1[1]
                course3.text? = Semester.sem1[2]
                course4.text? = Semester.sem1[3]
                course5.text? = Semester.sem1[4]
            case "sem2" :
                           course1.text? = Semester.sem2[0]
                           course2.text? = Semester.sem2[1]
                           course3.text? = Semester.sem2[2]
                           course4.text? = Semester.sem2[3]
                           course5.text? = Semester.sem2[4]
            
            case "sem3" :
                                     course1.text? = Semester.sem3[0]
                                     course2.text? = Semester.sem3[1]
                                     course3.text? = Semester.sem3[2]
                                     course4.text? = Semester.sem3[3]
                                     course5.text? = Semester.sem3[4]
        default:
            break
        }
       
    }
    
    @IBAction func calculate(_ sender: Any) {
       
        if course1_txt.text! == "" &&  course2_txt.text! == "" && course3_txt.text! == "" && course4_txt.text! == "" && course5_txt.text! == ""{
            alert = UIAlertController(title: "You cant leave empty fields ", message: "add in each field", preferredStyle: .alert)
                        alert?.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
                          self.present(alert!, animated: true)
            
        }else{
        var credits : [Double] = []
        var total_credit : Double = 0
        
        credits = [get_credit(Course: course1.text!),get_credit(Course: course2.text!),get_credit(Course: course3.text!),get_credit(Course: course4.text!),get_credit(Course: course5.text!)]
      
        student_grades = [credit_counter(credits: Int(course1_txt.text!)!) ,credit_counter(credits: Int(course2_txt.text!)!),credit_counter(credits: Int(course3_txt.text!)!),credit_counter(credits: Int(course4_txt.text!)!),credit_counter(credits: Int(course5_txt.text!)!)]
        
     
        for i in 0...4{
            
            let temp = Double(credits[i]) * student_grades[i]
            total_credit += credits[i]
            total += temp
            
            
        }
            let ttt = total / total_credit
            cgpa.text = "\(ttt)"
            switch  semChooseDelegate?.semName{
            case "sem1":
                Students.student_data[index].sem1_cgpa = ttt
            case "sem2":
                        Students.student_data[index].sem2_cgpa = ttt
            case "sem3":
                        Students.student_data[index].sem3_cgpa = ttt
                
            default: break
                        
            }
            
            
        
    }
    }
    
    func get_credit(Course : String) -> Double {
         
        let temp : String = String(Course.dropFirst(Course.count - 1))
        return Double(temp) ?? 0
        
    }
    
    func credit_counter(credits : Int) -> Double {
        switch credits {
            case 94...100 : return 4
            case 84...93 : return 3.7
            case 80...86 : return 3.5
            case 77...79 : return 3.2
            case 73...76 : return 3.0
            case 70...72 : return 2.7
            case 67...69 : return 2.3
            case 63...66 : return 2.0
            case 60...62 : return 1.7
            case 50...59 : return 1.0
            case 49...0  : return 0.0
            default      :  return 0
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
