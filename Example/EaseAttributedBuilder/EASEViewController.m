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

@end

@implementation EASEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel * textLabel = [UILabel new];
    textLabel.attributedText =
    [[[[EaseAttributedBuilder builderWithDefaultStyle:@{
        NSForegroundColorAttributeName: UIColor.redColor,
        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightLight]
    }] appendString:@"Hello World~"]
     appendString:@"make it Ease!" forStyle:@{
        NSForegroundColorAttributeName: UIColor.orangeColor,
     }] attributedString];
    [textLabel sizeToFit];
    textLabel.center = self.view.center;
    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
