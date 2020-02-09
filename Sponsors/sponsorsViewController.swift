//
//  sponsorsViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 2/7/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit

class sponsorsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
 //   let sponsorsTypeArray = ["Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor","Sponsor"]
    let    sponsorsImageArray = [#imageLiteral(resourceName: "foxmula"), #imageLiteral(resourceName: "drunkenmonkey"), #imageLiteral(resourceName: "markytics"),#imageLiteral(resourceName: "jetbrains"), #imageLiteral(resourceName: "hackerrank"), #imageLiteral(resourceName: "hasura"), #imageLiteral(resourceName: "digitalocean") ,#imageLiteral(resourceName: "bugsee") ,#imageLiteral(resourceName: "hackerearth"), #imageLiteral(resourceName: "docker"), #imageLiteral(resourceName: "balsamiq") ,#imageLiteral(resourceName: "github") ,#imageLiteral(resourceName: "mlh") ,#imageLiteral(resourceName: "estimote") ,#imageLiteral(resourceName: "kothari"), #imageLiteral(resourceName: "redback"), #imageLiteral(resourceName: "sketch"), #imageLiteral(resourceName: "nisna technologies"), #imageLiteral(resourceName: "zebronics")]
          let strURlToOpen = ["https://foxmula.com/", "https://www.thedrunkenmonkey.in/", "https://www.markytics.com/", "https://jetbrains.com/", "https://www.hackerrank.com/", "https://hasura.io/", "https://www.digitalocean.com/" , "https://bugsee.com/", "https://hackerearth.com/", "https://www.docker.com/" , "https://www.balsamiq.com/", "https://www.github.com/", "https://mlh.io", "https://www.estimote.com/", "https://kotharihosiery.com/", "https://www.redback.in/", "https://www.sketch.com/", "https://nisnatechnologies.com/", "https://zebronics.com"]
       
       
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sponsorsImageArray.count
    }
    
   /* func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sponsorsTypeArray.count
    } */
    
    
   /* private func collectionView(_ collectionView: UICollectionView, didSelectItemAt index: Int) {
        
        if let url = URL(string: strURlToOpen[index]) {
                       if #available(iOS 10, *){
                           UIApplication.shared.open(url)
                       }else{
                           UIApplication.shared.openURL(url)
                       }
                       
                   }
                   
    } */
 
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftInset = (self.view.frame.width - self.collectionView.contentSize.width)/4
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
        
    } */
    
    
  //  cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! sponsorsCollectionViewCell
        
        
        
      //  cell.sponsorsType.text = sponsorsTypeArray[indexPath.row]
        cell.sponsorsImage.image = sponsorsImageArray[indexPath.row]
        
        cell.layer.cornerRadius = 10

        return cell
        
    }
    
    
    
    
    
   

}
