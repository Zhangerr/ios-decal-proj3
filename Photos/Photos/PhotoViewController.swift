//
//  PhotoViewController.swift
//  Photos
//
//  Created by Alex Zhang on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBAction func back(sender: AnyObject) {
//        self.navigationController?.popToRootViewControllerAnimated(true)
        self.dismissViewControllerAnimated(true, completion:nil)
    }

    @IBAction func likeAction(sender: AnyObject) {
        liked = !liked
        if liked {
            like.setTitle("❤️", forState: .Normal)
        } else {
            like.setTitle("💔", forState: .Normal)
        }
    }
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var username: UILabel!
    var liked = false
    func loadImage(photo: Photo, imageView: UIImageView?) {
        if let url = NSURL(string: photo.url_hi) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    imageView!.image = UIImage(data: imageData)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        print(photoImageView)
        loadImage(url!, imageView: photoImageView)
        likes.text = String(url!.likes) + " likes"
        var dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormat.timeStyle = NSDateFormatterStyle.ShortStyle
        date.text = dateFormat.stringFromDate(url!.date)
        username.text = String(url!.username)
        
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var photoImageView: UIImageView!
    var url:Photo?
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
