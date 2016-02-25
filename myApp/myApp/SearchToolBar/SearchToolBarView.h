//
//  SearchToolBarView.h
//  myApp
//
//  Created by IMac on 16/2/24.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTextField.h"

typedef enum : NSUInteger {
    SearchToolStyleDateSelect,
    SearchToolStyleNone,
} SearchToolBarStyle;

typedef void(^ClickDateButtonBlock)();

@interface SearchToolBarView : UIView

@property (nonatomic ,assign) ClickDateButtonBlock dateButtonBlock;

@property (nonatomic, strong) CustomTextField *searchField;

@property (nonatomic ,assign) SearchToolBarStyle style;

-(instancetype)initWithFrame:(CGRect)frame didClickDateButton:(ClickDateButtonBlock)dateButtonBlock;

- (instancetype)initWithFrame:(CGRect)frame ToolStyle:(SearchToolBarStyle)style;

@end
