//
//  contactViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 2/1/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class contactViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MFMailComposeViewControllerDelegate {
  
    
    
    let boardNameArray = ["Kartik Gupta","Mayank Sethia","Siddharth Arul","Shreyas Gonjari","Nikhil Chakravarthy Mallela","Aditya Gawankar","G. Harika","Madhur Dheer","Arun Krishna"]
      
      let boardPositionArray = ["Chairperson","Vice Chairperson(Technical)","Vice Chairperson(Operations)","General Secretary","Design Director","Events Director","PR Director","Technical Director(ECE)","Technical Director(CSE)"]
      
      let imageArray = [#imageLiteral(resourceName: "kartik"), #imageLiteral(resourceName: "mayank"), #imageLiteral(resourceName: "sid"),#imageLiteral(resourceName: "shreyas"), #imageLiteral(resourceName: "nikhil"), #imageLiteral(resourceName: "aditya"), #imageLiteral(resourceName: "harika") ,#imageLiteral(resourceName: "madhur") ,#imageLiteral(resourceName: "arun")]
    
       
    
    @IBOutlet weak var websiteButton: UIButton!
    
       override func viewDidLoad() {
               super.viewDidLoad()

        websiteButton.layer.cornerRadius = 20
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! contactCollectionViewCell
        
        cell.boardImage.image = imageArray[indexPath.row]
        cell.boardName.text = boardNameArray[indexPath.row]
        cell.boardPosition.text = boardPositionArray[indexPath.row]
        
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = 20
        
        cell.layer.cornerRadius = 10
        
        cell.boardImage.layer.cornerRadius = cell.boardImage.frame.size.height/2
        
        
        return cell
        
      }
        
    
    @IBAction func fbButtonPressed(_ sender: Any) {
        
        let fbURLWeb: NSURL = NSURL(string: "https://www.facebook.com/ieteisf/")!
        let fbURLId: NSURL = NSURL(string: "fb://profile/293054244039042")!
        if(UIApplication.shared.canOpenURL(fbURLId as URL) )
        {
            UIApplication.shared.open(fbURLId as URL)
        }
        else{
            UIApplication.shared.open(fbURLWeb as URL)
        }
        
    }
    
    
    
    @IBAction func instaButtonPressed(_ sender: Any) {
        
        let instagramHooks = "https://www.instagram.com/iete_vit/"
                      let instagramUrl = NSURL(string: instagramHooks)
                      if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
                          UIApplication.shared.openURL(instagramUrl! as URL)
                      } else {
                          //redirect to safari because the user doesn't have Instagram
                          UIApplication.shared.openURL(NSURL(string: "https://www.instagram.com/iete_vit/")! as URL)
                      }
        
    }
    
    
    @IBAction func websiteButtonPressed(_ sender: Any) {
        
        if let url = URL(string: "https://ietevit.com/accessdenied/") {
                   UIApplication.shared.open(url)
               }
        
    }
    
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        
        let mailComposeViewController = configuredMailComposeViewController()
               if MFMailComposeViewController.canSendMail(){
                   self.present(mailComposeViewController, animated: true, completion: nil)
               }
               else{
                   self.showSendMailAlert()
               }
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController{
           
           let mailComposerVC = MFMailComposeViewController()
           mailComposerVC.mailComposeDelegate = self
           mailComposerVC.setToRecipients(["ietevit@vit.ac.in"])
           mailComposerVC.setSubject("Regarding Access Denied'20")
           mailComposerVC.setMessageBody("Hey Guys, \n I am have something Important to tell you", isHTML: false)
           //   present(mailComposerVC, animated: true)
           return mailComposerVC
           
       }
       
       func showSendMailAlert()
       {
           let sendMailErrorAlert = UIAlertView(title: "Could not Send E-Mail ", message: "Your device must have an active email account. Pls go to the Mail app and log in. (or) Contact us at \"ietevit@vit.ac.in\"", delegate: self, cancelButtonTitle: "OK")
       }
       
       func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
           controller.dismiss(animated: true, completion: nil)
       }
         
         
}
    



