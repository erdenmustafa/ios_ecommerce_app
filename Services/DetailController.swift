//
//  Detail.swift
//  Services
//
//  Created by Mustafa Erden on 1.11.2021.
//

import UIKit
import ImageSlideshow
import Kingfisher
import Alamofire


class DetailController: UIViewController, ImageSlideshowDelegate {
    
    static var item:Bilgiler!
    var imgArray:[KingfisherSource] = []
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideShow.delegate = self
        
        print(DetailController.item.productName)
        for item in DetailController.item.images! {
            if let img = KingfisherSource(urlString: item.normal) {
                imgArray.append(img)
            }
        }
        slideShow.slideshowInterval = 3.0
        slideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideShow.pageIndicator = pageControl
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(DetailController.didTap))
        slideShow.addGestureRecognizer(recognizer)
        slideShow.setImageInputs(imgArray)
        
    }
    
    @objc func didTap() {
        let fullScreenController = slideShow.presentFullScreenController(from: self)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: UIActivityIndicatorView.Style.medium, color: .white)
    }
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("pid : \(DetailController.item.productID) page :\(page)")
    }
    
    @IBAction func fncOrder(_ sender: UIButton) {
        
        let url = "https://www.jsonbulut.com/json/orderForm.php"
        let params = [ "ref":"c7c2de28d81d3da4a386fc8444d574f2","customerId":"553","productId": DetailController.item.productID,"html":"html"]
       
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            if (res.response?.statusCode == 200) {
                let jo = try? JSONDecoder().decode(JSONOrder.self, from: res.data!)
                let durum = jo?.order[0].durum
                if (durum!) {
                    print("Sipariş Alındı")
                }
                
            }
        }
    }
}
