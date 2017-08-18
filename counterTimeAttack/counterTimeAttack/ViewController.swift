//
//  ViewController.swift
//  counterTimeAttack
//
//  Created by nttr on 2017/08/02.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    var number : Int = 0
    @IBOutlet var label:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func plus(){
        number = number + 1
        label.text = String(number)
    }

    @IBAction func minus(){
        number = number - 1
        label.text = String(number)
    }
    
    @IBAction func clear(){
        number = 0
        label.text = String(number)
    }
    
    @IBAction func show(){
        SVProgressHUD.show()
        
    }
    
    @IBAction func dismiss(){
        SVProgressHUD.dismiss()
    }
    

}

