//
//  faqTableViewController.swift
//  AccessDenied
//
//  Created by Vandana Mittal on 2/2/20.
//  Copyright © 2020 Rohan Mittal. All rights reserved.
//

import UIKit

struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}


class faqTableViewController: UITableViewController {

    
    var tableViewData = [cellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewData = [cellData(opened: false, title: "Who is this hack for?", sectionData: ["We encourage and welcome undergraduate students of all backgrounds to join us."]), cellData(opened: false, title: "What if I don’t know how to code?", sectionData: ["Interest in learning and working with technology is much more important than your current experience level. No experience is needed — you will be able to work with various mentors, interact with companies, and learn alongside fellow participants."]), cellData(opened: false, title: "What if I don't have a team?", sectionData: ["You can register individually and approach other teams if you would like to collaborate."]), cellData(opened: false, title: "Where is this?", sectionData: ["The Hack will be at Vellore Institute of Technology, Vellore near Katpadi Railway station or a 2 and a hour hour drive from Chennai."]), cellData(opened: false, title: "What should I bring?", sectionData: ["A valid student-id, a laptop and any hardware you'd require."]), cellData(opened: false, title: "How much does this cost?", sectionData: ["Even though the price isn't set yet, we're trying to make it accessible to everyone."])]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0)
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            
            cell.backgroundColor = .black
            cell.textLabel?.font = cell.textLabel?.font.withSize(20)
            
            return cell
        }
        else
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row-1]
            cell.backgroundColor = .black
         //   cell.textLabel?.textColor = .white
              cell.textLabel?.font = cell.textLabel?.font.withSize(15)
            
            return cell
        }
        
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableViewData[indexPath.section].opened == true)
        {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
        else
        {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

}
