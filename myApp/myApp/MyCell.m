//
//  MyCell.m
//  myApp
//
//  Created by IMac on 16/2/17.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
//        [self setupUI];
        

        
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupUI];

    }
    
    return self;
}



- (void)setupUI
{
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(5, self.frame.size.height, self.frame.size.width-10, 5)];
    
    bottomView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.contentView addSubview:bottomView];
}

@end
