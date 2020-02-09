//
//  QRViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 12/24/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    let QRArray = ["bottle", "zebronics", "x", "z", "schwags"]
    
    
    @IBOutlet weak var QRImage: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        let x = randomNumber(probabilities: [0.1, 0.1, 0.2, 0.2,0.4])
        QRImage.image = UIImage(named: QRArray[x])
        
    }
    
    
    func randomNumber(probabilities: [Double]) -> Int {

        // Sum of all probabilities (so that we don't have to require that the sum is 1.0):
        let sum = probabilities.reduce(0, +)
        // Random number in the range 0.0 <= rnd < sum :
        let rnd = Double.random(in: 0.0 ..< sum)
        // Find the first interval of accumulated probabilities into which `rnd` falls:
        var accum = 0.0
        for (i, p) in probabilities.enumerated() {
            accum += p
            if rnd < accum {
                return i
            }
        }
        // This point might be reached due to floating point inaccuracies:
        return (probabilities.count - 1)
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
