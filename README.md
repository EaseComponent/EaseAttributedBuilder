# EaseAttributedBuilder

[![CI Status](https://img.shields.io/travis/Yrocky/EaseAttributedBuilder.svg?style=flat)](https://travis-ci.org/Yrocky/EaseAttributedBuilder)
[![Version](https://img.shields.io/cocoapods/v/EaseAttributedBuilder.svg?style=flat)](https://cocoapods.org/pods/EaseAttributedBuilder)
[![License](https://img.shields.io/cocoapods/l/EaseAttributedBuilder.svg?style=flat)](https://cocoapods.org/pods/EaseAttributedBuilder)
[![Platform](https://img.shields.io/cocoapods/p/EaseAttributedBuilder.svg?style=flat)](https://cocoapods.org/pods/EaseAttributedBuilder)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

EaseAttributedBuilder是为了便捷的创建属性字符串，对NSAttributedString的一个封装，保留了UIKit设置样式的方法，使用起来没有很大的陌生感。

```Objective-C

_innerBuilder = [EaseAttributedBuilder builderWithDefaultStyle:@{
    NSFontAttributeName: [UIFont systemFontOfSize:15],
    NSForegroundColorAttributeName: [UIColor orangeColor],
    NSParagraphStyleAttributeName: ({
        NSMutableParagraphStyle * style = [NSMutableParagraphStyle new];
        style.lineSpacing = 2;
        style;
    })
}];
```
接着就可以追加文本了，可以使用初始化的样式，也可以为文本设置单独的样式：

``` Objective-C

/// 追加的文本使用初始化的样式
[_innerBuilder appendString:text];

/// 为追加的文本设置特殊的样式
[_innerBuilder appendString:text forStyle:@{
    NSForegroundColorAttributeName: UIColor.greenColor
}];
```
单独的样式并不影响之后追加的文本：

``` Objective-C

_innerBuilder = [EaseAttributedBuilder builderWithDefaultStyle:@{
    NSFontAttributeName: [UIFont systemFontOfSize:15],
    NSForegroundColorAttributeName: [UIColor orangeColor]
}];

/// Hello is orange
[_innerBuilder appendString:@"Hello "];

/// Wrold is green
[_innerBuilder appendString:@"Wrold" forStyle:@{
    NSForegroundColorAttributeName: UIColor.greenColor
}];

/// ~ is also orange
[_innerBuilder appendString:@"~"];
```

除了可以追加文本，还可以追加`NSAttributedString`和`NSTextAttachment`：
``` Objective-C

[_innerBuilder appendAttributedString:({
    [[NSAttributedString alloc] initWithString:otherText attributes:@{
        NSFontAttributeName:[UIFont systemFontOfSize:24],
        NSForegroundColorAttributeName:UIColor.redColor
    }];
})];

[_innerBuilder appendAttachment:({
    NSTextAttachment *imageAtt = [[NSTextAttachment alloc] init];
    imageAtt.bounds = CGRectMake(0, 0, 18, 16);
    imageAtt.image = [UIImage imageNamed:@""];
    imageAtt;
})];
```

如果需要给一个给定的文本中某些字符串设定特殊的样式，可以使用以下api，参数`string`支持正则表达式，内部其实也是使用正则表达式来完成查找匹配的。

``` Objective-C

/// 第一次匹配的文本
- (EaseAttributedBuilder *) firstMatchConfigString:(NSString *)string
                                         withStyle:(EaseAttributesStyle)style;

/// 所有匹配的文本
- (EaseAttributedBuilder *) configString:(NSString *)string 
                               withStyle:(EaseAttributesStyle)style;
```

## Requirements

## Installation

EaseAttributedBuilder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EaseAttributedBuilder'
```

## Author

Yrocky, 983272765@qq.com

## License

EaseAttributedBuilder is available under the MIT license. See the LICENSE file for more info.
