//
//  developerInfoViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 1/14/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit

class developerInfoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let developerImageArray = [UIImage(named: "Rohan"), UIImage(named: "Manan")]
    let developerNameArray = ["Rohan Mittal", "Manan Agrawal"]
    let developerTypeArray = ["iOS App Developer", "Android App Developer"]
    let developerNumberArray = ["+91-8754583601","+91-8800647617"]
    let developerMailArray = ["rohanmittal01@gmail.com","redmanan@gmail.com"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return developerImageArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! developerInfoCollectionViewCell
        
        
        //Assigning Values
        cell.developerImage.image = developerImageArray[indexPath.row]
        cell.developerName.text = developerNameArray[indexPath.row]
        cell.developerType.text = developerTypeArray[indexPath.row]
        cell.developerMail.text = developerMailArray[indexPath.row]
        cell.developerNumber.text = developerNumberArray[indexPath.row]
        
        
        //cell elements layout
        cell.layer.cornerRadius = 6.0
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = 20
        cell.layer.cornerRadius = 6
        cell.developerImage.layer.cornerRadius = cell.developerImage.frame.size.height/2
        
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 10.0
        cell.layer.shadowOpacity = 3
    
        cell.layer.masksToBounds = false //<-
        
        
        return cell
       }
    
    
   
    

}
