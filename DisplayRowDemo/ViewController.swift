//
//  ViewController.swift
//  DisplayRowDemo
//
//  Created by Xiaodan Wang on 3/26/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let ary = ["Hello,", "Here is a demo test.", "Animations are added", "onto the table view cells.", "Cell rows","will be moving","at the moment they are created,", "until they are fully displayed.", "Download the project", "and tweak the prameters", "on your own!", "Enjoy,","guys!",]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = ary[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ary.count
    }
    //magic happens here
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //create rotation animation
        //x,y,z value will decide the direction to rotate
        let x:CGFloat = 1.0
        let y:CGFloat = 0.0
        let z:CGFloat = 0.0
        
        var rotation = CATransform3DMakeRotation(CGFloat(90*M_PI/180), x, y, z)
        rotation.m34 = 1 / -500
        
        cell.contentView.layer.transform = rotation
        cell.contentView.layer.anchorPoint = CGPoint(x:0,y:0)
        
        UIView.beginAnimations("rotation", context:nil)
        UIView.setAnimationDuration(1)
        
        cell.contentView.layer.transform = CATransform3DIdentity
        
        UIView.commitAnimations()
    }
}

