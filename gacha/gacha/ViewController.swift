//
//  ViewController.swift
//  gacha
//
//  Created by nttr on 2017/07/13.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var lanNameLabel: UILabel!
    @IBOutlet var lanSalayLabel: UILabel!
    @IBOutlet var lanImage: UIImageView!
    
    var lanIndex: Int = 0
    var imageFileNameArray: [String] = []
    var imageArray: [UIImage] = []
    var imageNameArray: [String] =
        [
            "Swift",
            "Python",
            "Ruby",
            "C++",
            "Java",
            "C",
            "JavaScript",
            "C#",
            "PHP",
            "Node",
            "CSS",
            "HTML",
            "JavaScript",
            "Objective-C"
    ]
    var imageSalaryArray: [String] =
        [
            "115,000",
            "107,000",
            "107,000",
            "104,000",
            "102,000",
            "102,000",
            "99,000",
            "94,000",
            "89,000",
            "no data"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randInt() -> Int {
        let randNum: UInt32 = arc4random_uniform(UInt32(imageNameArray.count))
        let returnNum = Int(randNum)
        return returnNum
    }
    
    
    //画像を配列化
    func imageInit(){
        for i in 0..<imageNameArray.count{
            imageFileNameArray.append(imageNameArray[i] + ".png")
            print(imageFileNameArray[i])
            imageArray.append(UIImage(named: imageFileNameArray[i])!)
        }
        if imageNameArray.count > imageSalaryArray.count{
            let diff: Int = imageNameArray.count - imageSalaryArray.count
            for _ in 0..<diff{
                imageSalaryArray.append("no data")
            }
        }
    }
    
    func changeName(i: Int){
        lanNameLabel.text = imageNameArray[i]
    }
    
    func changeSalaly(i: Int){
        lanSalayLabel.text = (String)("$" + imageSalaryArray[i])
    }
    
    // Launch when push Button "Gacha"
    func changeImage(i: Int){
        lanImage.image  = imageArray[i]
    }
    
    
    @IBAction func changeAll(){
        imageInit()
        let num: Int = randInt()
        lanIndex = num
        changeImage(i: num)
        changeName(i: num)
        changeSalaly(i: num)
        lanSalayLabel.textColor = UIColor.black
        lanSalayLabel.isHidden = false
    }
    
    @IBAction func moveNextView(){
        self.performSegue(withIdentifier: "toNextView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Next ViewController getting
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.receiveLanguage = imageNameArray[lanIndex]
    }

}

