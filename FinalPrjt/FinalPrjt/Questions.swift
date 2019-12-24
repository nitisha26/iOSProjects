//
//  Questions.swift
//  FinalPrjt
//
//  Created by Nitisha on 2019-12-02.
//  Copyright © 2019 CollegeLaSalle. All rights reserved.
//

import Foundation
import UIKit

class Questions
{
    var questions = [Question]()
    init(){
      
    

    
    questions.append(Question(ques : "india is a continent", ans : false))
    questions.append(Question(ques : "donald trump is the president of usa", ans :true))
    questions.append(Question(ques : "area of circle is pi*r ", ans : false))
    questions.append(Question(ques : "justin trudeau is the pm of canada", ans : true))
    questions.append(Question(ques : "mitochondria is called the power house of cell", ans : true))
    questions.append(Question(ques : "delhi is the capital of india", ans : true))
    questions.append(Question(ques : "chameleon can change colors", ans : false))
    questions.append(Question(ques : "dogs have a good sennse of smelling ", ans : true))
    questions.append(Question(ques : "humans are warm blooded", ans : true))
    questions.append(Question(ques : "lizard is  a reptile", ans : true))
    
    }
}
