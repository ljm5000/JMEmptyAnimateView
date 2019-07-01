# JMEmptyAnimateView
## 效果
![](./Effect/JMEmptyAnimateView.gif)

## 使用方式
* 一共3步  

```
#pragma mark - 实例化适配器
-(JMEmptyAnimatedBaseObject *)adapter{
    if (!_adapter) {
        _adapter = [[JMEmptyAnimatedBaseObject alloc] init];
    }
    return _adapter;
}

```
``` 
 //开始
   [self.adapter startAnimated:tmpView]; 
 	OR
   [self.adapter startViewControllerAnimated:self];
```
``` 
//结束
	[self.adapter endAnimation];
	OR
	[self.adapter endViewControllerAnimation];
``` 
## 设计原理


