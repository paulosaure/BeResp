//
//  ShopsViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController {
    
    static let cellSpacing: CGFloat = 10.0
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // Data
    var shops: [Shop] = ShopsController.shared.getShops()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = ShopCell.heightCell
        tableView.estimatedRowHeight = height
        tableView.rowHeight = height
        tableView.register(ShopCellConstant.nib, forCellReuseIdentifier: ShopCellConstant.reuseIdentifier)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension ShopsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(StoryboardManager.shopContainerViewController(shop: shops[indexPath.row]), animated: true)
    }
}

extension ShopsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopCellConstant.reuseIdentifier, for: indexPath) as? ShopCell else {
            fatalError("Unexpected cell ShopCell dequeued from tableView")
        }
        
        guard let shop = shops[indexPath.row] as? Shop else {
            return cell
        }
        
        cell.configure(with: shop)
        return cell
    }
}
