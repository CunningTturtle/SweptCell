//
//  ViewController.swift
//  SweptCell
//
//  Created by admin on 2021/4/26.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WLTableViewCellDelegate {

    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.delegate = self
        return cell
    }

    func willLeftSliding() -> [WLRightItemView] {
        let itemView1 = WLRightItemView.init(width: 100) { (model) in
            model.itemType = .nomal
        } tapClick: { (finsh) in
            finsh = true
        }
        itemView1.backgroundColor = .red
        
        
        let itemView2 = WLRightItemView.init(width: 100) { (model) in
            model.itemType = .alert
        } tapClick: { (finsh) in
            
        }
        itemView2.backgroundColor = .yellow
        return [itemView1,itemView2]
    }
}

class TableCell: SweptCell {

}

