//
//  DetailViewController.swift
//  PicDic
//
//  Created by nttr on 2017/07/19.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedName: String = ""
    var selectedImage: UIImage!
    
    @IBOutlet var selectedNameLabel: UILabel!
    @IBOutlet var selectedImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedNameLabel.text = selectedName
        selectedImageView.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }

}
