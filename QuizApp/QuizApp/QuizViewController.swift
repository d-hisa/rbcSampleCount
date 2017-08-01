//
//  QuizViewController.swift
//  QuizApp
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var icon:UIImageView!
    @IBOutlet var btn1:UIButton!
    @IBOutlet var btn2:UIButton!
    @IBOutlet var btn3:UIButton!
    @IBOutlet var btn4:UIButton!
    
    //@IBOutlet var correctLabel:UILabel!
    //@IBOutlet var inCorrectLaberl:UILabel!
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    var correctIconNum: Int = 0
    var iconDataArray:[Icon] = []
    var answerIconNumArray:[Int] = [0,0,0,0]
    
    let quizMax: Int = 10
    var quizCounter: Int = 0
    var correctAnswerCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readCSV()
        initButton()
        updateQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // CSVを読み込む関数
    func readCSV(){
        do {
            //CSVファイルのパスを取得する。
            let csvPath = Bundle.main.path(forResource: "icons", ofType: "csv")
            //CSVファイルのデータを取得する。
            let csvData = try String(contentsOfFile:csvPath!, encoding:String.Encoding.utf8)
            //改行区切りでデータを分割して配列に格納する。
            var dataRow: [String] = []
            dataRow = csvData.components(separatedBy: "\n")
            for i in 0..<dataRow.count{
                if dataRow[i] == "" {continue}
                var separatedData:[String] = dataRow[i].components(separatedBy: ",")
                //print(dataRow[i])
                //print(separatedData)
                let icon:Icon = Icon(name:separatedData[0],desc:separatedData[1], fileName: fileName(name: separatedData[0]),indexInCsv:i)
                    iconDataArray.append(icon)
            }            
        } catch {
            print(error)
        }
    }
    
    func initButton(){
        /*
        btn1.setBackgroundImage(UIImage(named: "white"), for: .normal)
        btn2.setBackgroundImage(UIImage(named: "white"), for: .normal)
        btn3.setBackgroundImage(UIImage(named: "white"), for: .normal)
        btn4.setBackgroundImage(UIImage(named: "white"), for: .normal)
 */
    }
    
    func fileName(name: String) -> String{
        return name + ".png"
    }
    
    func rand4() -> Int{
        return Int(arc4random_uniform(4))
    }
    
    func randItems() -> Int{
        return Int(arc4random_uniform(UInt32(iconDataArray.count)))
    }
    
    func randAny(num: Int) -> Int{
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    func updateQuiz(){
        if quizCounter == quizMax{
            self.performSegue(withIdentifier: "toResult", sender: nil)
        }
        quizCounter = quizCounter + 1
        answerIconNumArray.removeAll()
        correctIconNum = randItems()
        var answerArray:[Icon] = []
        var tempAnswerArray:[Icon] = []
        let correctIconItem: Icon = iconDataArray[correctIconNum]
        print(quizCounter)
        print(correctIconItem.name)
        var incorrectIconItems: [Icon] = []
        for _ in 0..<3 {
            incorrectIconItems.append(iconDataArray[randItems()])
        }
        //print("incorrectIconItems")
        //print(incorrectIconItems[0].name)
        //print(incorrectIconItems[1].name)
        //print(incorrectIconItems[2].name)
        tempAnswerArray.append(correctIconItem)
        tempAnswerArray.append(incorrectIconItems[0])
        tempAnswerArray.append(incorrectIconItems[1])
        tempAnswerArray.append(incorrectIconItems[2])
        for _ in 0..<tempAnswerArray.count{
            let r_index: Int = randAny(num: tempAnswerArray.count)
            answerArray.append(tempAnswerArray[r_index])
            tempAnswerArray.remove(at: r_index)
        }
        
        icon.image = UIImage(named: correctIconItem.name)
        btn1.setTitle(answerArray[0].name, for: .normal)
        answerIconNumArray.append(answerArray[0].indexInCsv)
        btn2.setTitle(answerArray[1].name, for: .normal)
        answerIconNumArray.append(answerArray[1].indexInCsv)
        btn3.setTitle(answerArray[2].name, for: .normal)
        answerIconNumArray.append(answerArray[2].indexInCsv)
        btn4.setTitle(answerArray[3].name, for: .normal)
        answerIconNumArray.append(answerArray[3].indexInCsv)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.correctResult = correctAnswerCounter
    }
    
    @IBAction func pushUpdate(){
        updateQuiz()
    }
    
    func isCorrect(answerIndex: Int) -> Bool{
        var result: Bool = false
        if answerIndex == correctIconNum{
            result = true
        }else{
            result = false
        }
        return result
    }
    
    func nextQuiz(){
        //sleep(2)
        initButton()
        updateQuiz()
    }
    
    
    
    func whenCorrect(btn: UIButton){
        //btn.setBackgroundImage(UIImage(named:"yellow"), for: .normal)
        animateButton(btn: btn, isCorrect: true)
        correctAnswerCounter = correctAnswerCounter + 1
        nextQuiz()
    }

    func whenIncorrect(btn: UIButton){
        animateButton(btn: btn, isCorrect: false)
        //btn.setBackgroundImage(UIImage(named: "red"), for: .normal)
        nextQuiz()
    }
    
    func animateButton(btn: UIButton, isCorrect: Bool){
        let b = btn.bounds
        
        if isCorrect {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 20,animations: {
                // ボタンサイズの変更
                //btn.bounds = CGRect(x: b.origin.x - 20, y: b.origin.y, width: b.size.width + 80, height: b.size.height)
                
                // button image change
                //btn.setBackgroundImage(UIImage(named:"red"), for: .normal)
                // ボタンカラーの変更
                btn.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.0, alpha: 1.0)
                // spinnerのalpha値を変更して表示
                //self.spinner.alpha = 1.0
                // spinnerの位置を設定
                //self.spinner.center = CGPoint(x: 40, y: btn.frame.size.height / 2)
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 20, animations: {
                // ボタンサイズを元に戻す
                //btn.bounds = CGRect(x: b.origin.x, y: b.origin.y, width: b.size.width, height: b.size.height)
                // button image change
                //btn.setBackgroundImage(UIImage(named:"white"), for: .normal)
                
                // ボタンカラーを元に戻す
                btn.backgroundColor = UIColor.clear
                // spinnerを非表示に
                //self.spinner.alpha = 0.0
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 20,animations: {
                // ボタンサイズの変更
                btn.bounds = CGRect(x: b.origin.x - 20, y: b.origin.y, width: b.size.width + 80, height: b.size.height)
                
                // button image change
                //btn.setBackgroundImage(UIImage(named:"red"), for: .normal)
                // ボタンカラーの変更
                btn.backgroundColor = UIColor(red: 0.85, green: 0.0, blue: 0.0, alpha: 1.0)
                // spinnerのalpha値を変更して表示
                self.spinner.alpha = 1.0
                // spinnerの位置を設定
                self.spinner.center = CGPoint(x: 40, y: btn.frame.size.height / 2)
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 20, animations: {
                // ボタンサイズを元に戻す
                btn.bounds = CGRect(x: b.origin.x, y: b.origin.y, width: b.size.width, height: b.size.height)
                // button image change
                //btn.setBackgroundImage(UIImage(named:"white"), for: .normal)
                
                // ボタンカラーを元に戻す
                btn.backgroundColor = UIColor.clear
                // spinnerを非表示に
                self.spinner.alpha = 0.0
            }, completion: nil)
        }

    }
    
    @IBAction func clickBtn1(){
        let index: Int = answerIconNumArray[0]
        if isCorrect(answerIndex: index){
            whenCorrect(btn: btn1)
        }else{
            whenIncorrect(btn: btn1)
        }
    }
    
    @IBAction func clickBtn2(){
        let index: Int = answerIconNumArray[1]
        if isCorrect(answerIndex: index){
            whenCorrect(btn: btn2)
        }else{
            whenIncorrect(btn: btn2)
        }
    }
    @IBAction func clickBtn3(){
        let index: Int = answerIconNumArray[2]
        if isCorrect(answerIndex: index){
            whenCorrect(btn: btn3)
        }else{
            whenIncorrect(btn: btn3)
        }
    }
    @IBAction func clickBtn4(){
        let index: Int = answerIconNumArray[3]
        if isCorrect(answerIndex: index){
            whenCorrect(btn: btn4)
        }else{
            whenIncorrect(btn: btn4)
        }
    }

}
