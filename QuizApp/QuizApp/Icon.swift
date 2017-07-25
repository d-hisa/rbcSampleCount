//
//  Icon.swift
//  QuizApp
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class Icon: NSObject {
    var name: String = ""
    var desc: String = ""
    var fileName:String = ""
    var indexInCsv: Int = 0
    
    init(name: String,desc:String,fileName:String,indexInCsv:Int){
        self.name = name
        self.desc = desc
        self.fileName = fileName
        self.indexInCsv = indexInCsv
    }
}
