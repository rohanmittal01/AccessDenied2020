//
//  faqTableViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 2/2/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit

//struct cellData{
//    var opened = Bool()
//    var title = String()
//    var sectionData = [String]()
//}


class faqViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var tableViewData = [cellData]()
    
    
    @IBOutlet weak var faqTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewData = [cellData(opened: false, title: "Who is this hack for?", sectionData: ["We encourage and welcome undergraduate students of all backgrounds to join us."]), cellData(opened: false, title: "What if I don’t know how to code?", sectionData: ["Interest in learning and working with technology is much more important than your current experience level. No experience is needed — you will be able to work with various mentors, interact with companies, and learn alongside fellow participants."]), cellData(opened: false, title: "What if I don't have a team?", sectionData: ["You can register individually and approach other teams if you would like to collaborate."]), cellData(opened: false, title: "Where is this?", sectionData: ["The Hack will be at Vellore Institute of Technology, Vellore near Katpadi Railway station or a 2 and a hour hour drive from Chennai."]), cellData(opened: false, title: "What should I bring?", sectionData: ["A valid student-id, a laptop and any hardware you'd require."]), cellData(opened: false, title: "How much does this cost?", sectionData: ["Even though the price isn't set yet, we're trying to make it accessible to everyone."])]
        
        
        tableDesign()
        
    }

    func tableDesign()
    {
        faqTableView.layer.cornerRadius = 10
    }
    
    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewData.count
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(tableViewData[section].opened == true)
        {
            return tableViewData[section].sectionData.count+1
        }
        else
        {
            return 1
        }
        
        
    }

    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0)
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            
            
            cell.layer.cornerRadius = 10
            cell.contentView.layer.masksToBounds = true
            //cell.backgroundColor = .black
            cell.textLabel?.font = cell.textLabel?.font.withSize(20)
          //  cell.textLabel?.textColor = .darkGray
            cell.layer.borderWidth = 2
          //  cell.layer.borderColor = UIColor.white.cgColor
            return cell
        }
        else
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row-1]
           
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.cornerRadius = 5
           cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
              cell.textLabel?.font = cell.textLabel?.font.withSize(15)
            
            return cell
        }
        
    
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableViewData[indexPath.section].opened == true)
        {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
            if let cell = tableView.cellForRow(at: indexPath){
              //  cell.contentView.backgroundColor = UIColor.red
                cell.textLabel?.textColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
            }

        }
        else
        {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            if let cell = tableView.cellForRow(at: indexPath){
              //  cell.contentView.backgroundColor = UIColor.red
                cell.textLabel?.textColor = .white
                cell.layer.borderColor = UIColor.white.cgColor
            }
        }
        faqTableView.deselectRow(at: indexPath, animated: true)
        
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          
          return 120
      }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
       
     let cellSpacingHeight : CGFloat = 15
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return cellSpacingHeight
       }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

}

