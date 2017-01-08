//
//  ViewController.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/5/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      MeetupAPIClient.getMeetupInformation { (meetupArray) in
        print("****************************")
        print(meetupArray)
        print("****************************")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

