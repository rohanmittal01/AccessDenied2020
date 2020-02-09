//
//  aboutViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 1/14/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    
        @IBOutlet weak var text1: UITextView!
        @IBOutlet weak var text2: UITextView!
        @IBOutlet weak var text3: UITextView!
        
        override var prefersStatusBarHidden: Bool
        {
            return true
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if (self.view.frame.width == 414)
            {
            text1.font = UIFont(name: text1.font!.fontName, size:15)
            text2.font = UIFont(name: text2.font!.fontName, size:15)
            text3.font = UIFont(name: text3.font!.fontName, size:15)
            }
            else if (self.view.frame.width == 375)
            {
                 text1.font = UIFont(name: text1.font!.fontName, size:14)
                 text2.font = UIFont(name: text2.font!.fontName, size:14)
                 text3.font = UIFont(name: text3.font!.fontName, size:14)
            }
            else if (self.view.frame.width == 320)
            {
                text1.font = UIFont(name: text1.font!.fontName, size:13)
                text2.font = UIFont(name: text2.font!.fontName, size:13)
                text3.font = UIFont(name: text3.font!.fontName, size:13)
            }
            // Do any additional setup after loading the view.
        }
        
      
       
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */


    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
