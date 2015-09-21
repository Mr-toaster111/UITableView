//
//  ViewController.swift
//  UITableViewExample
//
//  Created by mathieu on 21/09/2015.
//  Copyright (c) 2015 gueroult. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var arraySource = NSMutableArray()
    var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTableView(){

        //Populate your array source
        arraySource.insertObject("object1", atIndex: 0)
        arraySource.insertObject("object2", atIndex: 0)
        arraySource.insertObject("object3", atIndex: 0)
        arraySource.insertObject("object4", atIndex: 0)

        //setup your tableView
        tableView = UITableView(frame: CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40), style: UITableViewStyle.Grouped)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        //Create a footer and a header for your tableView
        let footerTableView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        footerTableView.backgroundColor = UIColor.blueColor()

        let textFieldFooter = UILabel(frame: footerTableView.bounds)
        textFieldFooter.text = "Footer view"
        textFieldFooter.textAlignment = .Center
        footerTableView.addSubview(textFieldFooter)

        let headerTableView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        headerTableView.backgroundColor = UIColor.redColor()

        let textFieldHeader = UILabel(frame: headerTableView.bounds)
        textFieldHeader.text = "Header view"
        textFieldHeader.textAlignment = .Center
        headerTableView.addSubview(textFieldHeader)

        //Add your header and your footer to your tableView
        tableView.tableFooterView = footerTableView
        tableView.tableHeaderView = headerTableView

        //add your tableView in your main view
        self.view.addSubview(tableView)


    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = "\(arraySource.objectAtIndex(indexPath.row))"
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        return cell
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "row selected : \(indexPath.row) in section \(indexPath.section) ", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else if section == 1 {
            return 1
        }
        else {
            return 1
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }








}

