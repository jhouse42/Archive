//
//  ViewController.swift
//  Archive
//
//  Created by Jeanie House on 2/26/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit


private let documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)[0] as String


class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
        
        
        loadDots()

        NSNotificationCenter.defaultCenter().addObserverForName("appIsClosing", object: nil, queue: NSOperationQueue()) { (notification) -> Void in
            
            self.saveDots()
            
        }
        
        
        
       
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    let dotsData = documentsDirectoryPath + "/dots1.data"

    
    func saveDots() {
        // get the dots from boardview
        // archive dots to file path
        
        let bView = self.view as BoardView
        NSKeyedArchiver.archiveRootObject(bView.dots, toFile: documentsDirectoryPath + "/dots.data")
        
        
        
    }
    
    func loadDots() {
        // get file path for dots archive
        //unarchive file path to dots array
        // set boardview dots
        
        let bView = self.view as BoardView
        
        
        if let dots = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsDirectoryPath + "/dots.data") as? [Dot] {
          
            bView.dots = dots
            bView.setNeedsDisplay()
            
            
            
        }
        

        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}// END

