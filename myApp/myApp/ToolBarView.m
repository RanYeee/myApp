//
//  ToolBarView.m
//  myApp
//
//  Created by IMac on 16/2/23.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "ToolBarView.h"

@interface ToolBarView ()


@end

@implementation ToolBarView

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frame = frame;
        
        self.titleArray = titleArray;
        
        [self setupView];
    }
    
    return self;
}


- (void)setupView
{

    CGFloat btnH = self.frame.size.height;
    
    CGFloat btnW = self.frame.size.width/self.titleArray.count;
    
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(btnW*idx, 0, btnW, btnH);
        
        [button setTitle:obj forState:UIControlStateNormal];
        
        button.backgroundColor = [UIColor colorWithRed:1.0 green:0.9922 blue:0.9176 alpha:1.0];
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"向下箭标@3x.png"]];
        
        iconView.frame = CGRectMake(button.titleLabel.frame.origin.x+40, button.titleLabel.frame.origin.y-5, 10, 10);
        
        [button addSubview:iconView];
       
        [self addSubview:button];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside
         ];
        
        if (idx != self.titleArray.count-1) {
        
            UIView *lineView = [[UIView alloc]init];
            
            lineView.frame = CGRectMake(button.frame.size.width*(idx+1), 0, 3.0, btnH/2);
            
            lineView.center = CGPointMake(button.center.x + btnW/2, btnH/2);
            
            lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            
            [self insertSubview:lineView aboveSubview:button];

        }
     
        
    }];
    
}


- (void)buttonClick:(UIButton *)sender
{
    CGAffineTransform rotation ;
    
    UIImageView *iconImage = (UIImageView *)sender.subviews[1];

    if (iconImage.transform.a == -1.0f ) {
        
        rotation = CGAffineTransformMakeRotation(2*M_PI);

    }else{
        
        rotation = CGAffineTransformMakeRotation(M_PI);

    }
    
    [iconImage setTransform:rotation];
    
    
    if (_selectedItemBlock) {
        
        _selectedItemBlock(sender);
    }
    
    
}

-(void)selectedAtItem:(SelectedItemBlock)itemBlock
{
    
    self.selectedItemBlock = itemBlock;
}


@end
