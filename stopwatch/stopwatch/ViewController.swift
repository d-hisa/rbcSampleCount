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
    var lapTime: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.backgroundColor = UIColor.cyan
        lapTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func update(){
        countNum+=1
        label.text = count2String(count: countNum)
    }
    
    func count2String(count: Int) -> String {
        let ms = countNum % 100
        let s = (countNum - ms) / 100 % 60
        let m = (countNum - s - ms) / 6000 % 3600
        return String (format: "%02d:%02d.%02d", m,s,ms)
    }
    
    func changeButton(){
        if isTimerRunning{
            button.backgroundColor = UIColor.red
            button.setTitle("Stop", for: UIControlState.normal)
        }else{
            button.backgroundColor = UIColor.cyan
            button.setTitle("Start", for: UIControlState.normal)
        }
    }
    
    func stop(){
        if isTimerRunning == true{
            timer.invalidate()
            isTimerRunning = false
        }
    }
    
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

    
    @IBAction func showAlert(){
        let alert = UIAlertController(title:"Coution!", message: "Description", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){
            (action)
            in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func reset(){
        countNum = 0
        label.text = "00:00.00"
        lapTime.removeAll()
        lapTableView.reloadData()
    }
    
    @IBAction func lapTimeStock(){
        if isTimerRunning{
            lapTime.append(countNum)
            print(lapTime)
            lapTableView.reloadData()
        }else{
            return
        }
    }
    
    /* for Table View */
    // Max amount of table cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapTime.count   // max cells
    }
    // Present Data for Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell")!
        cell.textLabel?.text = count2String(count: lapTime[indexPath.row])
        //cell.textLabel?.text = count2String(count: lapTime.last!)
        print(cell)
        return cell
    }

}

