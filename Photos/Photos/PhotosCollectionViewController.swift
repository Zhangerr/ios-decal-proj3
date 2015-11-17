//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit
//extension UIImageView {
//    public func imageFromUrl(urlString: String) {
//        if let url = NSURL(string: urlString) {
//            let request = NSURLRequest(URL: url)
//            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
//                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//                if let imageData = data as NSData? {
//                    self.image = UIImage(data: imageData)
//                }
//            }
//        }
//    }
//}
class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo] = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let p = photos[indexPath.row]
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! InstagramPhotoCell
//        cell.imageView.imageFromUrl(p.url)
        loadImageForCell(p, imageView: cell.imageView)
        return cell
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let p = photos[indexPath.row];
        print(p.url)
  //      let newScreen = PhotoViewController()
//        newScreen.view.backgroundColor = UIColor.redColor()
        let screen = self.storyboard!.instantiateViewControllerWithIdentifier("viewcont") as! PhotoViewController
        screen.url = p
        screen.view.frame = self.view.frame
  //      screen.url = p
//        screen.photoImageView = UIImageView()
//        print(self.storyboard!.instantiateViewControllerWithIdentifier("viewcont"))
//                screen.url = p
        self.presentViewController(screen, animated: true) { () -> Void in
                    //screen.url = p

        }
    }
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        if let url = NSURL(string: photo.url) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    imageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

