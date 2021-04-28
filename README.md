# SweptCell
SweptCell 一款swift版本的tableViewCell的侧滑删除的控件 有两种侧滑模式 第一种是普通的侧滑 第二种是带有提醒模式的侧滑

## Requirements
- Swift 5.0+
## Usage
```swift
import SnapKit
1 继承 TableCell
2 遵守WLTableViewCellDelegate协议
3 实现 func willLeftSliding() -> [WLSweptItemModel] 方法

func willLeftSliding() -> [WLSweptItemModel] {
    //普通侧滑
    let model = WLSweptItemModel.init()
    model.willClose = { canClose in
        //当任务结束后 将该值赋值为true 即可关闭 侧滑
        canClose = true
    }
    model.contentView.backgroundColor = .red

    //带有提醒模式的侧滑
    let modelAlert = WLSweptItemModel.init()
    modelAlert.itemType = .alert
    //与父视图之间的绑定建议用约束绑定
    modelAlert.contentView.addSubview(contentView())

    modelAlert.willClose = { canClose in
        //当任务结束后 将该值赋值为true 即可关闭 侧滑
        canClose = true
    }
    modelAlert.willAlert = { manager in
        //在此处可以修改第二阶段的要展示的UI
        if let subView = manager.subviews.first as? UILabel {
            subView.text = "333"
        }
    }
    modelAlert.contentView.backgroundColor = .yellow
    return [model,modelAlert]
}

```
