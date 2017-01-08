//
//  MeetupDataStore.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupDataStore{

    static let sharedInstance = MeetupAPIClient()
    private init(){}
    
    var meetupArray: [SingleMeetup] = []
    
    



}
