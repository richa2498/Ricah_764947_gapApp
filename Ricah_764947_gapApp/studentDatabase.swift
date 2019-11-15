//
//  studentDatabase.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

struct Students {
    
    var first_Name : String
    var last_Name  : String
    var student_Id : String
    var sem1_cgpa : Double = 0.0
    var sem2_cgpa : Double = 0.0
    var sem3_cgpa : Double = 0.0
    static var student_data = [Students]()
    
}
