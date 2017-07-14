//
//  ViewController.swift
//  Count
//
//  Created by nttr on 2017/07/12.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Prototype
    var number: Int = 0
    var flag: Int = 0
    @IBOutlet var label: UILabel!
    //IB = interfacebuilder Outret: parts to receive order from program
    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // count up action func
    @IBAction func plus(){
        //number = number + 1
        number += 1
        label.text = String(number)
    }
    @IBAction func minus(){
        number = number - 1
        label.text = String(number)
    }
    @IBAction func reset(){
        number = 0
        label.text = String(number)
    }
    @IBAction func half(){
        number = number / 2
        label.text = String(number)
    }
    @IBAction func double(){
        number = number * 2
        label.text = String(number)
    }
    @IBAction func random(){
        number = Int(arc4random())
        label.text = String(number)
    }
    @IBAction func changeImage(){
        if(flag == 0){
            photoImageView.image = UIImage(named: "app_images.001.png")
            flag = 1
        }else if(flag == 1){
            photoImageView.image = UIImage(named: "iPhone6_02.png")
            flag = 0
        }
        print(flag)
    }
    /*
    @IBAction func resize(){
        let orgWidth: CGFloat = photoImageView.image!.size.width
        let orgHeight: CGFloat = photoImageView.image!.size.height
        let size = CGSize(width: orgWidth, height: orgHeight)
        UIGraphicsBeginImageContext(size)
        let megutan: UIImage = UIImage(named: "megutan.png")!
        megutan.draw(in: CGRect(x: 0, y: 0, width: size.width, heioght: size.height))
        var resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let view2: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, heioght: size.height))
        view2.image = resizeImage
    }*/

}

