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
    
    func getMeetupInformationWith(Completion: @escaping(Array<Any>) -> ()){
    
        MeetupAPIClient.getMeetupInformation { (meetupArray) in
            for singleDictionary in meetupArray{

                guard let unwrappedSingleDictionary = singleDictionary as? [String: Any] else {
                    print("singleDictionary in array did not unwrap"); return}
                
                
                
                
                
                
            
            }
        }
    
    }
    
    
    


}
