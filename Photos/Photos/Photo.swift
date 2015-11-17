//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    var date: NSDate!
    var url_hi: String!
    /* Parses a NSDictionary and creates a photo object. */

    
    init(likes:Int, url: String, username: String, date: String, url_hi:String) {
        self.likes = likes
        self.url = url
        self.username = username
        self.date = NSDate(timeIntervalSince1970: NSTimeInterval(Int(date)!))
        self.url_hi = url_hi
//        NSDate(timeIntervalSince1970: NSTimeInterval(2))
    }
    convenience  init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        self.init(likes: data["likes"] as! Int, url: data["url"] as! String, username: data["username"] as! String, date: data["date"] as! String, url_hi: data["url_hi"] as! String)
    }

}