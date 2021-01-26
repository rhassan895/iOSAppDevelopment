//
//  ViewController.swift
//  Project1
//
//  Created by Rashne Hassan on 25/01/2021.
//

import UIKit

class ViewController: UITableViewController {
    //attach data to whole viewcontroller type, so it exisst as long as screen does
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        //! incase there isn't a resource path
        let items = try! fm.contentsOfDirectory(atPath: path)
        //! because try may fail
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //cellForRowAt call when each provider row
    //row to show is specifed at indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //its creating a new cell by recycling a previous one
        cell.textLabel?.text = pictures[indexPath.row]
        //? do this if there is a textlabel there
        return cell
    }
}

