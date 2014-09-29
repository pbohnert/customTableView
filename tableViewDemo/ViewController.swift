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
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as UserCell
        
        var user = users[indexPath.row]
        cell.nameLabel.text = user["name"]
        cell.hometownLabel.text = user["hometown"]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

