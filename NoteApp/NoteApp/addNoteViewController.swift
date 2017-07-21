//
//  addNoteViewController.swift
//  NoteApp
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class addNoteViewController: UIViewController {

    @IBOutlet var noteTextView: UITextView!
    @IBOutlet var noteTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func content2summary(content: String) -> String {
        let length: Int = content.characters.count
        var returnContent: String = ""
        if length < 20 {
            //returnContent = content.substring(to: content.index(content.startIndex, offsetBy: 5))
            returnContent = "too long text, can't previewing..."
        }else{
            returnContent = content
        }
        print(length)
        return returnContent
    }
    
    @IBAction func saveNote(){
        let inputText = noteTextView.text
        let inputTitle = noteTitleTextField.text
        let userDefaults: UserDefaults = UserDefaults.standard
        if userDefaults.array(forKey: "noteArray") != nil{
            var saveNoteArray: [[String:String]] = userDefaults.array(forKey: "noteArray")! as! [[String:String]]
            var saveDicPair = [String:String]()
            if(inputText != nil){
                saveDicPair["noteTitle"] = inputTitle
                saveDicPair["noteSummary"] = content2summary(content: inputText!)
                saveDicPair["noteContent"] = inputText
                saveNoteArray.append(saveDicPair)
            }else{
                print("Empty")
            }
            print(saveNoteArray)
            userDefaults.set(saveNoteArray, forKey: "noteArray")
        }else{
            var newNoteArray: [[String:String]] = []
            var saveDicPair = [String:String]()
            if(inputText != nil){
                saveDicPair["noteTitle"] = inputTitle
                saveDicPair["noteSummary"] = content2summary(content: inputText!)
                saveDicPair["noteContent"] = inputText
                newNoteArray.append(saveDicPair)
            }else{
                print("Empty")
            }
            print(newNoteArray)
            userDefaults.set(newNoteArray, forKey: "noteArray")
        }
        self.dismiss(animated: true, completion: nil)
    }

}
