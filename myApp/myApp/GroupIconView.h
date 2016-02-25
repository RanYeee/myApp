//
//  GroupIconView.h
//  myApp
//
//  Created by IMac on 16/2/23.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupIconView : UIView

@property (nonatomic ,copy) NSArray *iconArray;

-(instancetype)initWithFrame:(CGRect)frame iconArray:(NSArray *)iconArray;

@end
