//
//  ViewController.swift
//  Services
//
//  Created by Mustafa Erden on 15.10.2021.
//

import UIKit
import Alamofire
import SDWebImage


class ProductController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var array: [Bilgiler] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {  
        super.viewDidLoad()
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        print( paths[0] )
        let uuid = UUID().uuidString
        print(uuid)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = "https://www.jsonbulut.com/json/product.php"
        let params = [ "ref":"c7c2de28d81d3da4a386fc8444d574f2","start":"0" ]
        
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            if (res.response?.statusCode == 200 ) {
                let js = try? JSONDecoder().decode(JSONData.self, from: res.data!)
                self.array = js?.products[0].bilgiler ?? []
                self.tableView.reloadData()
                
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductItem
        let obj = array[indexPath.row]
        cell.lblTitle.text = obj.productName
        cell.lblPrice.text = obj.price
        if let url = obj.images?[0].normal {
            cell.img.sd_setImage(with: URL(string: url), completed: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = array[indexPath.row]
        DetailController.item = obj
        performSegue(withIdentifier: "detail", sender: nil)
    }
    
    @IBAction func fncOrderList(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "orderList", sender: nil)
    }
    
    
}




