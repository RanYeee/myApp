//
//  ToolBarView.h
//  myApp
//
//  Created by IMac on 16/2/23.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedItemBlock)(UIButton *item);

@interface ToolBarView : UIView

@property (nonatomic ,copy) NSArray *titleArray;

@property (nonatomic, assign) SelectedItemBlock selectedItemBlock;

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

- (void)selectedAtItem:(SelectedItemBlock)itemBlock;

@end
