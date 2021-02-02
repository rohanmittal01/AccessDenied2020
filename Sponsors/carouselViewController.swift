//
//  carouselViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 12/26/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit

class carouselViewController: UIViewController {

    
    
    
    let    imageArray = [UIImage(named: "codingNinjas"), UIImage(named: "collegeFever"), UIImage(named: "creativeTim"), UIImage(named: "github"), UIImage(named: "jetbrains"), UIImage(named: "mlh")]
       let strURlToOpen = ["https://www.codingninjas.com/", "https://www.thecollegefever.com/", "https://www.creative-tim.com/", "https://www.github.com/", "https://www.jetbrains.com/", "https://mlh.io"]
    
    
    
    
  //  @IBOutlet weak var titleSponsor: UIImageView!
    
    @IBOutlet weak var iCarouselView: iCarousel!
    
    
    
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
            
              //  titleSponsorFunc()
                //image Tap Feature

//        iCarouselView.type = .coverFlow
        iCarouselView.type = .linear
            iCarouselView.contentMode =  .scaleAspectFit
            iCarouselView.isPagingEnabled = true
                
                
                let shadowSize: CGFloat = 20
                let shadowDistance: CGFloat = 20
                let contactRect = CGRect(x: -shadowSize, y: iCarouselView.frame.height - (shadowSize * 0.4) + shadowDistance, width: iCarouselView.frame.width + shadowSize * 2, height: shadowSize)
           
                
                iCarouselView.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
                    iCarouselView.layer.shadowRadius = 5
                iCarouselView.layer.shadowOpacity = 0.8


            // Do any additional setup after loading the view.
        }
        
        
      
        
  /*     func titleSponsorFunc()
        {
        let shadowRadius: CGFloat = 5
//        titleSponsor.layer.shadowRadius = shadowRadius
//        titleSponsor.layer.shadowOffset = CGSize(width: 0, height: 10)
//        titleSponsor.layer.shadowOpacity = 0.5
//
        // how strong to make the curling effect
        let curveAmount: CGFloat = 20
        let shadowPath = UIBezierPath()
        
        // the top left and right edges match our view, indented by the shadow radius
        shadowPath.move(to: CGPoint(x: shadowRadius, y: 0))
        shadowPath.addLine(to: CGPoint(x: titleSponsor.frame.width - shadowRadius, y: 0))
        
        // the bottom-right edge of our shadow should overshoot by the size of our curve
        shadowPath.addLine(to: CGPoint(x: titleSponsor.frame.width - shadowRadius, y: titleSponsor.frame.height + curveAmount))
        
        // the bottom-left edge also overshoots by the size of our curve, but is added with a curve back up towards the view
        shadowPath.addCurve(to: CGPoint(x: shadowRadius, y: titleSponsor.frame.height + curveAmount), controlPoint1: CGPoint(x: titleSponsor.frame.width, y: titleSponsor.frame.height - shadowRadius), controlPoint2: CGPoint(x: 0, y: titleSponsor.frame.height - shadowRadius))
        titleSponsor.layer.shadowPath = shadowPath.cgPath
        
        }
        */
        

    }

    extension carouselViewController : iCarouselDelegate, iCarouselDataSource{
        
        
        func numberOfItems(in carousel: iCarousel) -> Int {
            
            return imageArray.count
        }
        
        func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
            
            
            
            let imageView = UIImageView()
            
        
         
                
            imageView.frame=CGRect(x: 0, y:0, width:iCarouselView.frame.width, height:iCarouselView.frame.height)
                
                imageView.contentMode = .scaleAspectFit
        
            imageView.image = imageArray[index]
            
            
               //image Tap Feature
         /*   iCarouselView.isUserInteractionEnabled = true
            iCarouselView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
          */
            
            
            
            
            imageView.backgroundColor = .init(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
            imageView.layer.shadowPath = UIBezierPath(rect: iCarouselView.bounds).cgPath
            imageView.layer.shadowRadius = 8
            imageView.layer.shadowOffset = .zero
            imageView.layer.shadowOpacity = 1
            

            
            return imageView
            
        }
       
       
        
        func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
            if let url = URL(string: strURlToOpen[index]) {
                if #available(iOS 10, *){
                    UIApplication.shared.open(url)
                }else{
                    UIApplication.shared.openURL(url)
                }
                
            }
            
        }
        
        

}
