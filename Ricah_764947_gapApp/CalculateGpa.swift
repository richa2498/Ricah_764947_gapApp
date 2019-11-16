//
//  CalculateGpa.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class CalculateGpa: UIViewController{

    @IBOutlet weak var celebration: UILabel!
    
    @IBOutlet weak var course1_txt: UITextField!
    @IBOutlet weak var course2_txt: UITextField!
    @IBOutlet weak var course3_txt: UITextField!
    @IBOutlet weak var course4_txt: UITextField!
    @IBOutlet weak var course5_txt: UITextField!
    
    
    
    @IBOutlet var cources: [UILabel]!
    var audio : AVAudioPlayer!
    var semChooseDelegate : SemChooseViewController?
    var alert : UIAlertController?
    var student_grades : [Double] = []
    var total : Double = 0
    var stud_final_gpa : Double = 0.0
    var index : Int = -1
   
    @IBOutlet weak var cgpa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
             let v = UITapGestureRecognizer(target: self, action: #selector(ontap))
             self.view.addGestureRecognizer(v)
             
        index = semChooseDelegate!.index
               
        switch semChooseDelegate?.semName {
        case "sem1" :
            
            for i in cources.indices{
                
                cources[i].text = Semester.sem1[i]
                
            }
            
            if !Students.student_data[index].sem1.isEmpty{
                
                course1_txt.text = "\(Students.student_data[index].sem1[0])"
                course2_txt.text = "\(Students.student_data[index].sem1[1])"
                course3_txt.text = "\(Students.student_data[index].sem1[2])"
                course4_txt.text = "\(Students.student_data[index].sem1[3])"
                course5_txt.text = "\(Students.student_data[index].sem1[4])"
                cgpa?.text = "\(Students.student_data[index].sem1_cgpa)"
               
            }

            case "sem2" :
            for i in cources.indices{
                
                cources[i].text = Semester.sem2[i]
                
            }
            if !Students.student_data[index].sem2.isEmpty{
                           course1_txt.text = "\(Students.student_data[index].sem2[0])"
                           course2_txt.text = "\(Students.student_data[index].sem2[1])"
                           course3_txt.text = "\(Students.student_data[index].sem2[2])"
                           course4_txt.text = "\(Students.student_data[index].sem2[3])"
                           course5_txt.text = "\(Students.student_data[index].sem2[4])"
                 cgpa?.text = "\(Students.student_data[index].sem2_cgpa)"
                       }

            case "sem3" :
            for i in cources.indices{
                
                cources[i].text = Semester.sem3[i]
                
            }
            if !Students.student_data[index].sem3.isEmpty{
                
                           course1_txt.text = "\(Students.student_data[index].sem3[0])"
                           course2_txt.text = "\(Students.student_data[index].sem3[1])"
                           course3_txt.text = "\(Students.student_data[index].sem3[2])"
                           course4_txt.text = "\(Students.student_data[index].sem3[3])"
                           course5_txt.text = "\(Students.student_data[index].sem3[4])"
                 cgpa?.text = "\(Students.student_data[index].sem3_cgpa)"
                       }

        default:
            break
        }
        
        
       
        
    }
    @objc func ontap(){
          
          course1_txt.resignFirstResponder()
          course2_txt.resignFirstResponder()
          course3_txt.resignFirstResponder()
          course4_txt.resignFirstResponder()
          course5_txt.resignFirstResponder()
        
          
      }
    
    @IBAction func calculate(_ sender: Any) {
       
        var credits : [Double] = []
        var total_credit : Double = 0
        var final_cgpa = 0.0
        total = 0
        if course1_txt.text! == "" &&  course2_txt.text! == "" && course3_txt.text! == "" && course4_txt.text! == "" && course5_txt.text! == ""{
            alert = UIAlertController(title: "You cant leave empty fields ", message: "add in each field", preferredStyle: .alert)
                        alert?.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
                          self.present(alert!, animated: true)
            
        }else{
        
        
            for i in cources.indices{
                
                credits.append(get_credit(Course: cources[i].text!))
            }
            
        student_grades = [credit_counter(credits: Int(course1_txt.text!)!) ,credit_counter(credits: Int(course2_txt.text!)!),credit_counter(credits: Int(course3_txt.text!)!),credit_counter(credits: Int(course4_txt.text!)!),credit_counter(credits: Int(course5_txt.text!)!)]
            
         
        for i in 0...4{
            
            let temp = Double(credits[i]) * student_grades[i]
            total_credit += credits[i]
            total += temp
            
            
        }
           final_cgpa = total / total_credit
            cgpa.text = String(format: "%.2f", final_cgpa)
            if final_cgpa > 2.8{

                       let soundURL = Bundle.main.url(forResource: "Win", withExtension: "wav")
                       audio = try! AVAudioPlayer(contentsOf: soundURL!)
                       audio.play()
                celebration.isHidden = false
            }
            let i : [Int] = [Int(course1_txt.text!)!,Int(course2_txt.text!)!,Int(course3_txt.text!)!,Int(course4_txt.text!)!,Int(course5_txt.text!)!]
            switch  semChooseDelegate?.semName{
            case "sem1":
                        Students.student_data[index].sem1_cgpa = final_cgpa
                        Students.student_data[index].sem1 = i
            case "sem2":
                        Students.student_data[index].sem2_cgpa = final_cgpa
                        Students.student_data[index].sem2 = i
            case "sem3":
                        Students.student_data[index].sem3_cgpa = final_cgpa
                        Students.student_data[index].sem3 = i
                
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
            case 0...49  : return 0.0
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
