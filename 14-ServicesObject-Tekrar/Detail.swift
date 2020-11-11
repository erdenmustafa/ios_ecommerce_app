//
//  Detail.swift
//  14-ServicesObject-Tekrar
//
//  Created by emir kartal on 25.09.2020.
//  Copyright © 2020 Mustafa Erden. All rights reserved.
//

import UIKit
import ImageSlideshow
import Kingfisher
import Alamofire

class Detail: UIViewController, ImageSlideshowDelegate {
    
    static var item:Bilgiler!
    var imgArr:[KingfisherSource] = []
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideshow.delegate = self

        print(Detail.item.productName)
        
        for item in Detail.item.images {
            let img = KingfisherSource(urlString: item.normal)!
            imgArr.append(img)
        }
        
        slideshow.slideshowInterval = 1.5
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFit
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(Detail.didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        slideshow.setImageInputs(imgArr)
        
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: UIActivityIndicatorView.Style.medium, color: .white)
    }
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        //print("pid : \(Detail.item.productID) page : \(page) ")
    }
    
    @IBAction func fncOrder(_ sender: UIButton) {
        
        let url = "http://jsonbulut.com/json/orderForm.php"
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "customerId" :"553", "productId": Detail.item.productID, "html" :"html"]
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            if ( res.response?.statusCode == 200 ) {
                let jo = try? JSONDecoder().decode(JSONOrder.self, from: res.data!)
                let durum = jo?.order[0].durum
                if ( durum != nil ) {
                    if (durum! == true) {
                        print("Siparis Alindi")
                    }
                }
            }
            
        }
        
    }
    

}
