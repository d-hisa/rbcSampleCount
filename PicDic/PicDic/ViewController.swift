//
//  ViewController.swift
//  PicDic
//
//  Created by nttr on 2017/07/19.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listContent = [
        ["contentName": "C",    "imageName": "C.png",   "ifdesc": "if(condition){}else if(){}else{}"],
        ["contentName": "C#",   "imageName": "C#.png",   "ifdesc": "if(condition){}else if(){}else{}"],
        ["contentName": "C++",  "imageName": "C++.png",  "ifdesc": "if(condition){}else if(){}else{}"],
        ["contentName": "Python",  "imageName": "Python.png",  "ifdesc": "if condition : elif condition : else : "]
    ]
    
    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listTableView.dataSource = self
        listTableView.delegate = self   // delegateMethod(共通化されたメソッド)を使えるようになる
        listTableView.tableFooterView = UIView()
        let nib = UINib(nibName: "ListTableViewCell", bundle: Bundle.main)
        listTableView.register(nib, forCellReuseIdentifier: "contentCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listContent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as! ListTableViewCell
        cell.listLabel.text = listContent[indexPath.row]["contentName"]
        cell.listImageView.image = UIImage(named: listContent[indexPath.row]["imageName"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)    //選択状態解除
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let selectedIndex = listTableView.indexPathForSelectedRow!
        detailViewController.selectedName = listContent[selectedIndex.row]["contentName"]!
        detailViewController.selectedImage = UIImage(named: listContent[selectedIndex.row]["imageName"]!)
    }


}

