//
//  ViewController.swift
//  stopwatch
//
//  Created by nttr on 2017/07/14.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var label:  UILabel!
    var countNum: Int = 0
    var isTimerRunning: Bool = false
    var timer: Timer = Timer()
    @IBOutlet var button: UIButton!
    @IBOutlet var lapTableView: UITableView!
    @IBOutlet var lapCustomTableView: UITableView!
    var lapTime: [Int] = []
    var lapTimeImages: [UIImage] = []
    var lapTimeImageNames: [String] = ["lap.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.backgroundColor = UIColor.cyan
        imageInit()
        lapTableView.dataSource = self
        lapTableView.tableFooterView = UIView() // needless cells made invisivles
        // CustomCells regist
        lapCustomTableView.dataSource = self
        lapCustomTableView.tableFooterView = UIView()
        let nib = UINib(nibName: "lapTableViewCell", bundle: Bundle.main)
        lapCustomTableView.register(nib, forCellReuseIdentifier: "CustomCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // images intialized function
    func imageInit(){
        for i in 0..<lapTimeImageNames.count{
            lapTimeImages.append(UIImage(named: lapTimeImageNames[i])!)
        }
    }
    
    // time label update
    func update(){
        countNum+=1
        label.text = count2String(count: countNum)
    }
    
    // Int count change to time format
    func count2String(count: Int) -> String {
        let ms = count % 100
        let s = (count - ms) / 100 % 60
        let m = (count - s - ms) / 6000 % 3600
        return String (format: "%02d:%02d.%02d", m,s,ms)
    }
    
    // changing buttton Start and Stop
    func changeButton(){
        if isTimerRunning{
            button.backgroundColor = UIColor.red
            button.setTitle("Stop", for: UIControlState.normal)
        }else{
            button.backgroundColor = UIColor.cyan
            button.setTitle("Start", for: UIControlState.normal)
        }
    }
    
    // Stop
    func stop(){
        if isTimerRunning == true{
            timer.invalidate()
            isTimerRunning = false
        }
    }
    
    // Start Timer
    @IBAction func startTimer(){
        if isTimerRunning {
            stop()
            changeButton()
        } else {
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target:self,
                selector: #selector(ViewController.update),
                userInfo: nil,
                repeats: true
            )
            isTimerRunning = true
            changeButton()
        }
    }

    /*
    @IBAction func showAlert(){
        let alert = UIAlertController(title:"Coution!", message: "Description", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){
            (action)
            in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }*/
    
    // reset button function
    @IBAction func reset(){
        countNum = 0
        label.text = "00:00.00"
        lapTime.removeAll()
        lapTableView.reloadData()
    }
    
    // laptime stock
    @IBAction func lapTimeStock(){
        if isTimerRunning{
            lapTime.append(countNum)
            print(lapTime)
            lapTableView.reloadData()
            lapCustomTableView.reloadData()
        }else{
            return
        }
    }
    
    /* for Table View */
    // Max amount of table cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return lapTime.count   // max cells
        }else if tableView.tag == 2 {
            return lapTime.count
        }else{
            return lapTime.count
        }
        //return 4 :4つだけ表示したいとき
    }
    // Present Data for Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
            // get cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell")!
            //cell.textLabel?.text = count2String(count: lapTime[indexPath.row])
            // decide present views
            let lapImageView = cell.viewWithTag(1) as! UIImageView
            let lapLavelView = cell.viewWithTag(2) as! UILabel
            lapImageView.image = lapTimeImages[0]
            lapLavelView.text = count2String(count: lapTime[indexPath.row])
            return cell
        }else if tableView.tag == 2{
            let ccell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! lapTableViewCell
            ccell.lapImageView.image = lapTimeImages[0]
            ccell.lapLabel.text = count2String(count: lapTime[indexPath.row])
            return ccell
        }else{
            // get cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell")!
            //cell.textLabel?.text = count2String(count: lapTime[indexPath.row])
            // decide present views
            let lapImageView = cell.viewWithTag(1) as! UIImageView
            let lapLavelView = cell.viewWithTag(2) as! UILabel
            lapImageView.image = lapTimeImages[0]
            lapLavelView.text = count2String(count: lapTime[indexPath.row])
            return cell
        }
    }
    

}

