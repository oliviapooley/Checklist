//
//  ViewController.swift
//  Checklist
//
//  Created by Livy on 12/02/2015.
//  Copyright (c) 2015 Livy. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem] ()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var firstItem = ChecklistItem()
        firstItem.name = "My first item"
        items.append(firstItem)
        
        var secondItem = ChecklistItem()
        secondItem.name = "Go shopping"
        items.append(secondItem)
        
        var thirdItem = ChecklistItem()
        thirdItem.name = "Do homework"
        items.append(thirdItem)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as! UITableViewCell
        
        let label = cell.viewWithTag(100) as! UILabel
        
        let item = items[indexPath.row]
        
        if item.done == true{
            label.alpha = 1.0
        } else {
            label.alpha = 0.2
        }
        
        label.text = item.name
        configureCheckmark(cell, item: item)
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("touched a row")
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            
            let item = items[indexPath.row]
            
            item.done = !item.done
            
            configureCheckmark(cell, item: item)
            
            let label = cell.viewWithTag(100) as! UILabel
            
            //UIView.animateWithDuration(1.0, animations: {
              //  label.alpha = 1.0
                //label.center.x = label.center.x + 40
            //})
            
            UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
                label.alpha = 1.0
                label.center.x = 100
            
                }, completion: nil)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureCheckmark(cell: UITableViewCell, item: ChecklistItem){
        if item.done == true{
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
    
    }
    
}











