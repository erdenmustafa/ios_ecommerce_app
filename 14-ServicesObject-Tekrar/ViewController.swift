//
//  ViewController.swift
//  14-ServicesObject-Tekrar
//
//  Created by emir kartal on 18.09.2020.
//  Copyright © 2020 Mustafa Erden. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var arr: [Bilgiler] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(paths[0])
        let uuid = UUID().uuidString
        print(uuid)

        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = "http://jsonbulut.com/json/product.php"
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "start" :"0" ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            if ( res.response?.statusCode == 200 ) {
                
                let js = try? JSONDecoder().decode(JSONData.self, from: res.data!)
                self.arr = js?.products[0].bilgiler as! [Bilgiler]
                self.tableView.reloadData()
                /*
                for item in self.arr {
                    print(item.productName)
                
                }*/
                
                
            }
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductItem
        let bil = arr[indexPath.row]
        
        cell.lblTitle.text = bil.productName
        cell.lblPrice.text = bil.price
        
        let url = bil.images[0].normal
        cell.img.sd_setImage(with: URL(string: url), completed: nil)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bil = arr[indexPath.row]
        Detail.item = bil
        performSegue(withIdentifier: "Detail", sender: nil)
    }
    
    @IBAction func fncOrderList(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "orderlist", sender: nil)
        
    }
    


}


