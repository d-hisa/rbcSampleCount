//
//  CollectionViewController.swift
//  QuizApp
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var iconTableView: UITableView!
    var visibleIconArray: [Icon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconTableView.dataSource = self
        iconTableView.delegate = self
        iconTableView.tableFooterView = UIView()
        let nib = UINib(nibName: "iconCell", bundle: Bundle.main)
        iconTableView.register(nib, forCellReuseIdentifier: "iconCell")
        loadVisibleIcons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadVisibleIcons(){
        let ud = UserDefaults.standard
        if(ud.array(forKey: "visibleIconArray") != nil){
            visibleIconArray = ud.array(forKey: "visibleIconArray") as! [Icon]
            iconTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleIconArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iconCell") as! iconTableViewCell
        cell.iconLabel.text = visibleIconArray[indexPath.row].name
        cell.iconImageView.image = UIImage(named:visibleIconArray[indexPath.row].fileName)!
        return cell
    }
}
