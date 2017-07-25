//
//  Quiz.swift
//  QuizApp
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class Quiz: NSObject {
    var iconFileName: String
    var iconImage: UIImage!
    
    
    init(iconFileName: String, answerNum: [Int]) {
        self.iconFileName = iconFileName
        //self.answerNum
    }
    
    // シャッフルするアルゴリズム(フィッシャー&イェーツ・アルゴリズム)
    class func shuffle(quizArray: [Quiz]) -> [Quiz] {
        var quiz = quizArray
        var shuffledQuizArray: [Quiz] = []
        for _ in 0..<quiz.count {
            let index = Int(arc4random_uniform(UInt32(quiz.count)))
            shuffledQuizArray.append(quiz[index])
            quiz.remove(at: index)
        }
        return shuffledQuizArray
    }

}
