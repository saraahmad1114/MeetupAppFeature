//
//  MeetupAPIClient.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/5/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupAPIClient {

    class func getMeetupInformation( completion:@escaping(Array<Any>)->()){
    
        var meetupJsonDictionary : Array<Any> = []
        
        let meetupURL = "https://api.meetup.com/2/events?key=\(Secrets.meetupKey)&group_urlname=ny-tech&sign=true"
        
        let url = URL(string: meetupURL)
        
        guard let unwrappedURL = url else {print("url did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedURL)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let unwrappedData = data else {print("data did not unwrap"); return}
            
            let responseDictionary = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
            
            guard let unwrappedResponseDictionary = responseDictionary else {print("Response Dictionary did not unwrap"); return}
            
            let resultsArray = unwrappedResponseDictionary["results"] as? Array<Any>
            
            guard let unwrappedResultsArray = resultsArray else {print("resultsArray did not unwrap"); return}
                
            meetupJsonDictionary = unwrappedResultsArray
            
            print("******************************")
            print(meetupJsonDictionary)
            print("******************************")
            
            completion(meetupJsonDictionary)
            
        })
        
        task.resume()
    
    }


}
