//
//  domainViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 1/30/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit

class domainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
   
    
  
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    let domainNamesArray = ["Premium","Industrial Automation","Defence","Agriculture","Rural Transformation","Transportation","Disaster Mitigation","Society Welfare","Healthcare","Data Science"]
    
    let domainImagesArray = [#imageLiteral(resourceName: "premium"), #imageLiteral(resourceName: "industrial_auto"), #imageLiteral(resourceName: "defense"),#imageLiteral(resourceName: "agriculture"), #imageLiteral(resourceName: "rural"), #imageLiteral(resourceName: "rural"), #imageLiteral(resourceName: "disaster") ,#imageLiteral(resourceName: "society welfare") ,#imageLiteral(resourceName: "healthcare"), #imageLiteral(resourceName: "disaster")]
    
    @IBAction func accessDeniedButton(_ sender: Any) {
        
        if let url = URL(string: "https://ietevit.com/accessdenied/") {
                          UIApplication.shared.open(url)
                      }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
    }
    
    
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return domainNamesArray.count
      
        }
      
    
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! domainCollectionViewCell
          
          cell.domainName.text = domainNamesArray[indexPath.row]
          cell.domainImage.image = domainImagesArray[indexPath.row]
        
        cell.layer.cornerRadius = 6
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
              layout?.minimumLineSpacing = 15
        
          
          return cell
          
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
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
