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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell")
            as! TableCell
        cell.delegate = self
        return cell
    }

    func willLeftSliding() -> [WLSweptItemModel] {
        let model = WLSweptItemModel.init()
        model.willClose = { canClose in
            canClose = true
        }
        model.contentView.backgroundColor = .red

        let model1 = WLSweptItemModel.init()
        model1.itemType = .alert
        model1.contentView.addSubview(contentView())

        model1.willClose = { canClose in
            canClose = true
        }
        model1.willAlert = { manager in
            if let subView = manager.subviews.first as? UILabel {
                subView.text = "333"
            }
        }
        model1.contentView.backgroundColor = .yellow
        return [model,model1]
    }

    func contentView() -> UIView {
        let label = UILabel.init()
        label.frame = CGRect.init(x: 0, y: 0, width: 40, height: 30)
        label.text = "222"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }
}

class TableCell: WLTableViewCell {

}

