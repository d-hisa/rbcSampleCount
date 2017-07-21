//
//  detailViewController.swift
//  NoteApp
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var noteTextView: UITextView!
    @IBOutlet var noteTitleView: UITextField!
    var selectedNote: String = ""
    var selectedNoteTitle: String = ""
    var selectedRows: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        noteTextView.text = selectedNote
        noteTitleView.text = selectedNoteTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteNote(){
        let ud = UserDefaults.standard
        if ud.array(forKey: "noteArray") != nil{
            var savedNoteArray = ud.array(forKey: "noteArray") as! [[String:String]]
            // TODO: 削除できない不具合をなんとかする
            print(ud.array(forKey: "noteArray"))
            print(savedNoteArray)
            savedNoteArray.remove(at: selectedRows)
            ud.set(savedNoteArray, forKey: "noteArray")
            ud.synchronize()
        }else{
            print("cannot deleted")
        }
    }

    

}
