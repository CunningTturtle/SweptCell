# SweptCell 
SweptCell 一款swift版本的tableViewCell的侧滑删除的控件 有两种侧滑模式 第一种是普通的侧滑 第二种是带有提醒模式的侧滑

## Requirements
- Swift 5.0+
## Usage
```swift

pod 'SweptCell', :git => 'https://github.com/CunningTturtle/SweptCell.git'

import SweptCell

1 继承 WLTableViewCell

    class CustomCell: WLTableViewCell {
         xxx 自己的东西
    }

2 遵守WLTableViewCellDelegate协议

     class ViewController: UIViewController,WLTableViewCellDelegate {
     }
     
3 设置代理

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell")
            as! CustomCell
        cell.delegate = self
        return cell
    }
    
4 实现 func willLeftSliding() -> [WLSweptItemModel] 方法

//普通侧滑 这里可以返回值是一个数组可以返回多个item
func willLeftSliding() -> [WLSweptItemModel] {
    
    let model = WLSweptItemModel.init()
    model.willClose = { canClose in
        //当任务结束后 将该值赋值为true 即可关闭 侧滑 
        //点击的回调
        canClose = true
    }
    model.contentView.backgroundColor = .red
    return [model]
}

//带有提醒模式的侧滑 这里可以返回值是一个数组可以返回多个item
func willLeftSliding() -> [WLSweptItemModel] {

    let modelAlert = WLSweptItemModel.init()
    modelAlert.itemType = .alert
    //与父视图之间的绑定建议用约束绑定
    modelAlert.contentView.addSubview(contentView())

    modelAlert.willClose = { canClose in
        //当任务结束后 将该值赋值为true 即可关闭 侧滑
        //点击的回调
        canClose = true
    }
    modelAlert.willAlert = { manager in
        //在此处可以修改第二阶段的要展示的UI
        //点击的回调
        if let subView = manager.subviews.first as? UILabel {
            subView.text = "333"
        }
    }
    modelAlert.contentView.backgroundColor = .yellow

    return [modelAlert]
}
    
## 如果需要刷新item数据 请reloadCell 或者 reloadTableView
```
