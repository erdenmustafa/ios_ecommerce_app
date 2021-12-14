//
//  OrderList.swift
//  Services
//
//  Created by Mustafa Erden on 6.11.2021.
//

import UIKit
import Alamofire

class OrderListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var orderListTableView: UITableView!
    
    var arrayOrder: [OrderList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
        
        let url = "https://www.jsonbulut.com/json/orderList.php"
        let params = [ "ref":"c7c2de28d81d3da4a386fc8444d574f2","musterilerID":"553" ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            if (res.response?.statusCode == 200 ) {
                
                let joList = try? JSONDecoder().decode(JSONOrderList.self, from: res.data!)
                if ( joList != nil ) {
                    self.arrayOrder = joList?.orderList[0] ?? []
                    self.orderListTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderListCell") as! OrderListCell
        let order = arrayOrder[indexPath.row]
        cell.cellTitleLbl.text = order.urunAdi
        return cell
    }
    
    
}
