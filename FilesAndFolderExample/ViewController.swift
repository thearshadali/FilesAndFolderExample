//
//  ViewController.swift
//  FilesAndFolderExample
//
//  Created by Arshad Ali on 02/12/18.
//  Copyright © 2018 Arshad Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fm : FileManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }
    
    @IBAction func createBtnAction(_ sender: UIButton) {
        createNewFolder()
    }
    
    func createNewFolder(){
        let fm = FileManager.default
        let docUlrs = fm.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let docUrl = docUlrs.first {
          let newFolderUrl = docUrl.appendingPathComponent("newFolder")  // documentsDirectory/newFolder
            // create new folder
            do{
                try fm.createDirectory(at: newFolderUrl, withIntermediateDirectories: false, attributes: nil)
                 printFolderContents()
            }catch{
                print(error.localizedDescription)
            }
           
        }
       
    }

    func printFolderContents(){
           let fm = FileManager.default
           let docUlr = try? fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if docUlr != nil {
          let results = try? fm.contentsOfDirectory(at: docUlr!, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            if results != nil {
                for r in results!{
                    print(r)
                }
            }
        }
        
    }
    

}

