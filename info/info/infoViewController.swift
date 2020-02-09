//
//  infoViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 1/13/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit
class infoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var settingsTable: UITableView!
    
    
    
        var indexPos=0
    
    var tableArray = ["FAQ              >",
                      "About IETE       >",
                      "Contact Us       >",
                      "Developer Info   >"]
    
    
    @IBAction func accessDeniedButton(_ sender: Any) {
        
        if let url = URL(string: "https://ietevit.com/accessdenied/") {
                          UIApplication.shared.open(url)
                      }
        
    }
    
    
    
    @IBAction func prizeButton(_ sender: Any) {
        
        //1. Create the alert controller.
               let alert = UIAlertController(title: "Lucky Prize", message: "Enter Access Code to reveal the Lucky Prize", preferredStyle: .alert)

               //2. Add the text field. You can configure it however you need.
               alert.addTextField { (textField) in
                   textField.text = ""
               }

               // 3. Grab the value from the text field, and print it when the user clicks OK.
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                   let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                   print("Text field: \(textField?.text)")
                   
                   if(textField?.text == "poseidon"){
                       
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let vc = storyboard.instantiateViewController(withIdentifier: "Prize")
                   self.navigationController!.pushViewController(vc, animated: true)
                   }
                   else{
                       let alert2 = UIAlertController(title: "Incorrect Access Code", message: "Please Try Again", preferredStyle: .alert)
                       
                       alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                       
                        self.present(alert2, animated: true, completion: nil)
                      
                       
                       
                   }
               }))

               // 4. Present the alert.
               self.present(alert, animated: true, completion: nil)
               

        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTable.dataSource = self
        settingsTable.delegate = self
      //  settingsTable.separatorStyle = UITableViewCell.separatorStyle.singleline
        settingsTable.separatorColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableArray.count
    }
    
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! infoTableViewCell
        cell.myLabel.text = tableArray[indexPath.row]
     //   print("done 1")
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        
        settingsTable.separatorColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        indexPos=indexPath.row
        if(indexPos==0)
        {
           // DispatchQueue.main.async(){
               self.performSegue(withIdentifier: "faq1", sender: self)
          //  }
            print("0")
        }
        else if(indexPos==1)
        {
            DispatchQueue.main.async(){
               self.performSegue(withIdentifier: "about_iete", sender: self)
            }//self.performSegue(withIdentifier: "about_iete", sender: self)
            print("1")
        }
        else if(indexPos==2)
        {
             DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "Contact_Us", sender: self)
             }
        }
        else if(indexPos==3)
        {
            self.performSegue(withIdentifier: "developer_info", sender: self)
        }
        
           settingsTable.deselectRow(at: indexPath, animated: true)

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
