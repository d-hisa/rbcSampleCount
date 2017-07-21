//
//  ViewController.swift
//  NoteApp
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var noteArray: [[String: String]] = []

    @IBOutlet var noteTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        noteTableView.dataSource  = self
        noteTableView.delegate = self
        noteTableView.tableFooterView = UIView()
        let nib = UINib(nibName: "noteTableViewCell", bundle: Bundle.main)
        noteTableView.register(nib, forCellReuseIdentifier: "noteCell")
        loadNotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! noteTableViewCell
        let section = noteArray[indexPath.row]
        cell.titleLabel.text = section["noteTitle"]
        cell.summaryLabel.text = section["noteSummary"]
        return cell
    }
    
    func loadNotes(){
        let userDefaults = UserDefaults.standard
        if(userDefaults.array(forKey: "noteArray") != nil){
            noteArray = userDefaults.array(forKey: "noteArray") as! [[String:String]]
            noteTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ((segue.destination as? detailViewController) != nil) {
        let DetailViewController = segue.destination as! detailViewController
        let selectedIndexPath = noteTableView.indexPathForSelectedRow!
        print(selectedIndexPath.row)
        print(noteArray[selectedIndexPath.row])
        print(noteArray[selectedIndexPath.row]["noteContent"]!)
        DetailViewController.selectedNote = noteArray[selectedIndexPath.row]["noteContent"]!
        DetailViewController.selectedNoteTitle = noteArray[selectedIndexPath.row]["noteTitle"]!
        DetailViewController.selectedRows = selectedIndexPath.row
        }
    }

}

