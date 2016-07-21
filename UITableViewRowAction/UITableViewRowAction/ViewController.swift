//
//  ViewController.swift
//  UITableViewRowAction
//
//  Created by Madriz on 20/7/16.
//  Copyright © 2016 MMApps. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewRowAction Example")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewRowAction Example", forIndexPath: indexPath)
        cell.textLabel?.text = String("\(cell.reuseIdentifier!) - \(indexPath.row)")
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Simple button"
        case 1:
            cell.textLabel?.text = "Button with custom background color"
        case 2:
            cell.textLabel?.text = "Button with gradient background"
        case 3:
            cell.textLabel?.text = "Button with emoticon"
        case 4:
            fallthrough
        default:
            cell.textLabel?.text = "Multiple buttons"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        switch indexPath.row {
        case 0:
            let more = UITableViewRowAction(style: .Default, title: "More") { action, index in
                print("more button tapped")
            }
            return [more]
        case 1:
            let more = UITableViewRowAction(style: .Default, title: "More") { action, index in
                print("more button tapped")
            }
            more.backgroundColor = .purpleColor()
            return [more]
        case 2:
            let more = UITableViewRowAction(style: .Default, title: "More") { action, index in
                print("more button tapped")
            }
            more.backgroundColor = UIColor(patternImage: buildGradient())
            return [more]
        case 3:
            let more = UITableViewRowAction(style: .Default, title: "\u{2B}\nMore") { action, index in
                print("more button tapped")
            }
            more.backgroundColor = UIColor(patternImage: buildGradient())
            return [more]
        case 4:
            let more = UITableViewRowAction(style: .Normal, title: "\u{2B}\nMore") { action, index in
                print("more button tapped")
            }
            let call = UITableViewRowAction(style: .Default, title: "\u{260F}\nCall now") { action, index in
                print("share button tapped")
            }
            return [more, call]
        default:
            return nil
        }
        
    }
    
    private func buildGradient() -> UIImage {
        let size = CGSize(width: 1, height: 44)
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        layer.colors = [UIColor.darkGrayColor().CGColor,   // start color
        UIColor.lightGrayColor().CGColor] // end color
        
        UIGraphicsBeginImageContext(size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
