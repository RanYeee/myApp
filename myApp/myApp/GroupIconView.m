//
//  GroupIconView.m
//  myApp
//
//  Created by IMac on 16/2/23.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "GroupIconView.h"

static CGFloat const kSpacing = 3.0f;

@interface GroupIconView ()


@end

@implementation GroupIconView

-(instancetype)initWithFrame:(CGRect)frame iconArray:(NSArray *)iconArray
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.layer.cornerRadius = 5.0f;
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.frame = frame;
        
        self.iconArray = iconArray;
        
        [self setupView];
    }
    
    return self;
}


- (void)setupView
{
    
    NSInteger iconCount = self.iconArray.count;
    
    __block CGRect iconRect ;
    
    __block CGFloat iconWH;
    
    [self.iconArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIImage *iconImage = [UIImage imageNamed:obj];
 
        if (iconCount <= 3) {
            
            iconWH = (self.frame.size.width - (iconCount + 1)*kSpacing)/iconCount;

        }else{
            
            iconWH = (self.frame.size.width - 4*kSpacing)/3;
            
        }
        
        if (iconCount <= 3) {
            
            iconRect = CGRectMake(kSpacing+(iconWH+kSpacing)*idx, self.frame.size.height/2-0.5*iconWH, iconWH, iconWH);
            
        }else{
            
            float row = idx/3;
            
            float col = idx%3;
            
            iconRect = CGRectMake(kSpacing+(iconWH+kSpacing)*col, kSpacing+(iconWH+kSpacing)*row, iconWH, iconWH);
            
        }

        
        UIImageView *iconView = [[UIImageView alloc]initWithImage:iconImage];
        
        iconView.frame = iconRect;
    
        iconView.layer.cornerRadius = 5.0f;
        
        iconView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self addSubview:iconView];
            
     
        
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
