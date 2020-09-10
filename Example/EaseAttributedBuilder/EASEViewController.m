//
//  EASEViewController.m
//  EaseAttributedBuilder
//
//  Created by Yrocky on 09/08/2020.
//  Copyright (c) 2020 Yrocky. All rights reserved.
//

#import "EASEViewController.h"
#import <EaseAttributedBuilder/EaseAttributedBuilder.h>

@interface EASEViewController ()

@property (nonatomic ,strong) UIStackView * contentView;
@end

@implementation EASEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentView = [UIStackView new];
    self.contentView.frame = self.view.bounds;
    self.contentView.spacing = 10;
    self.contentView.alignment = UIStackViewAlignmentCenter;
    self.contentView.axis = UILayoutConstraintAxisVertical;
    self.contentView.distribution = UIStackViewDistributionFillEqually;
    [self.view addSubview:self.contentView];
    
    [self.contentView addArrangedSubview:[self example_1]];
    [self.contentView addArrangedSubview:[self example_2]];
    [self.contentView addArrangedSubview:[self example_3]];
    [self.contentView addArrangedSubview:[self example_4]];
    [self.contentView addArrangedSubview:[self example_5]];
}

- (UIView *) example_1{
    
    UILabel * textLabel = [UILabel new];
    textLabel.attributedText =
    [[[[EaseAttributedBuilder builderWithDefaultStyle:@{
        NSForegroundColorAttributeName: UIColor.redColor,
        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightLight]
    }] appendString:@"Hello World~"]
     appendString:@" make it Ease!" forStyle:@{
        NSForegroundColorAttributeName: UIColor.orangeColor,
     }] attributedString];
    [textLabel sizeToFit];
    return textLabel;
}

- (UIView *) example_2{
    
    UILabel * textLabel = [UILabel new];
    textLabel.attributedText =
    [[[[[EaseAttributedBuilder builderWithDefaultStyle:@{
        NSForegroundColorAttributeName: UIColor.orangeColor,
        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightLight]
    }] appendString:@"Hello "]
     appendString:@"World" forStyle:@{
        NSForegroundColorAttributeName: UIColor.greenColor,
     }] appendString:@"~"]
     attributedString];
    [textLabel sizeToFit];
    return textLabel;
}

- (UIView *) example_3{
    
    UILabel * textLabel = [UILabel new];
    textLabel.attributedText =
    [[[[[EaseAttributedBuilder builderWithDefaultStyle:@{
        NSForegroundColorAttributeName: UIColor.orangeColor,
        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightLight]
    }] appendString:@"Hello "]
     appendString:@"World" forStyle:@{
        NSForegroundColorAttributeName: UIColor.greenColor,
     }] appendAttributedString:({
        [[NSAttributedString alloc] initWithString:@" 你好" attributes:@{
            NSFontAttributeName:[UIFont systemFontOfSize:34],
            NSForegroundColorAttributeName:UIColor.redColor
        }];
    })] attributedString];
    [textLabel sizeToFit];
    return textLabel;
}

- (UIView *) example_4{
    
    UILabel * textLabel = [UILabel new];
    textLabel.attributedText =
    [[[EaseAttributedBuilder builderWithString:@"a[bc]d(you)A[BCD]1【大家好】2a[gs]34(me)"]
        configString:@"(?<=\\[)[^\\]]+" withStyle:@{
            NSForegroundColorAttributeName: UIColor.greenColor
        }] attributedString];
    [textLabel sizeToFit];
    return textLabel;
}

- (UIView *) example_5{
    
    UILabel * textLabel = [UILabel new];
    textLabel.attributedText =
    [[[[[EaseAttributedBuilder builderWithString:@"hello = nihao = Hello = 你好 = nihao"]
        configString:@"hello" withStyle:@{
            NSUnderlineColorAttributeName: [UIColor redColor],
            NSUnderlineStyleAttributeName: @1
        }] configString:@"nihao" withStyle:@{
            NSStrokeColorAttributeName: [UIColor orangeColor],
            NSStrokeWidthAttributeName: @1
        }] configString:@"H" withStyle:@{
            NSBackgroundColorAttributeName:[UIColor greenColor]
        }] attributedString];
    [textLabel sizeToFit];
    return textLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
