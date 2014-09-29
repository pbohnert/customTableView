//
//  ViewController.swift
//  tableViewDemo
//
//  Created by Peter Bohnert on 9/29/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var users: [[String:String]]!
    var isExpanded: [Int:Bool]! = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = [
            ["name" : "Peter Bohnert", "hometown" : "Emeryville"],
            ["name" : "Isabel", "hometown" : "Richmond"],
            ["name" : "Jonathan", "hometown" : "San Francisco"],
            ["name" : "Helen", "hometown" : "Pittsburg"],
            ["name" : "Rebecca", "hometown" : "Central Point"],
            ["name" : "Timothy", "hometown" : "Plano, TX"],
            ["name" : "Dianna", "hometown" : "Mountain View"]
        ]
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 107
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let expanded = isExpanded[section] {
            return expanded ? users.count : 1
        } else {
            return 1
        }
    }
    
    // define that our tableView will have sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    //define View for Header in Section, including setting background color, a label and add label as subview
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        
        headerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
        var headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 320, height: 50))
        headerLabel.text = "Section \(section)"
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let expanded = isExpanded[indexPath.section] {
            isExpanded[indexPath.section] = !expanded
            //println("expanded: \(expanded)")
        } else {
            isExpanded[indexPath.section] = true
             //println("expanded: \(isExpanded[indexPath.section])")
        }
        
        println("expanded: \(isExpanded[indexPath.section])")
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as UserCell
        
        var user = users[indexPath.row]
        cell.nameLabel.text = user["name"]
        cell.hometownLabel.text = user["hometown"]
        
        return cell
    }
    //for section, you need to specify height of header
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

