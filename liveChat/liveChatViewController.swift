//
//  liveChatViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 12/22/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit
import WebKit
class livechatViewController: UIViewController {

    let url : String = "https://tawk.to/chat/5c3db6b351410568a106b27e/default"


    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        display()
        // Do any additional setup after loading the view.
    }
    
    
    func display()
    {
        let url2 = URL(string: url)
        let urlRequest = URLRequest(url: url2!)
        webView.load(urlRequest)
    }

    
    //Mark: InternetConnection
 override func viewDidAppear(_ animated: Bool) {
     if( checkInternet.Connection())
     {
         self.Alert(Message: "Note: If the link does not load in time, please connect to a stable connection .")
         
     }
     else{
        

         self.Alert(Message: "Your device is not connected to the Internet. Else please connect to a stable connection.")
         
         // performSegue(withIdentifier: "liveChat", sender: Any?.self)
     }
     
 }
 
 func Alert(Message: String)
 {
     let alert=UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert)
     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
     self.present(alert, animated: true, completion:nil)
     
    

 }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
