//
//  ViewController.swift
//  timeattackCounter
//
//  Created by nttr on 2017/07/19.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var number: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func puls(){
        number += 1
        label.text = String(number)
    }
    @IBAction func minus(){
        number -= 1
        label.text = String(number)
    }
    @IBAction func reset(){
        number = 0
        label.text = String(number)
        
    }

    
}

