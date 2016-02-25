//
//  SearchToolBarView.m
//  myApp
//
//  Created by IMac on 16/2/24.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "SearchToolBarView.h"
#import "Masonry.h"
#import "CustomTextField.h"

@interface SearchToolBarView ()



@end

@implementation SearchToolBarView

-(instancetype)initWithFrame:(CGRect)frame didClickDateButton:(ClickDateButtonBlock)dateButtonBlock
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frame = frame;
        
        self.style = SearchToolStyleDateSelect;
        
        self.dateButtonBlock = dateButtonBlock;
        
        [self setUpView];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame ToolStyle:(SearchToolBarStyle)style
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.style = style;
        
        self.frame = frame;
        
        [self setUpView];
    }
    
    return  self;
}

- (void)setUpView
{
    
    self.backgroundColor = [UIColor colorWithRed:0.149 green:0.651 blue:0.9529 alpha:1.0];
    
    CGRect searchFieldRect ;
    
    if (self.style == SearchToolStyleNone) {
        //没有左边的日期选择按钮
        searchFieldRect = CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-20);
        
        
    }else if (self.style == SearchToolStyleDateSelect){
    
        //有日期选择按钮
        
        searchFieldRect = CGRectMake(70, 10, self.frame.size.width-76, self.frame.size.height-20);
        
        [self dateSelectButton];
    }
    
    _searchField = ({
    
    
        CustomTextField *searchField = [[CustomTextField alloc]initWithFrame:searchFieldRect];
        
        UIImageView *searchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_ic_magnifier.png"]];
        
        searchIcon.frame = CGRectMake(0, 0, 22, 22);
        
        searchField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入关键字查找" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
        
        
        
        searchField.clearButtonMode=UITextFieldViewModeWhileEditing;
        
        searchField.borderStyle = UITextBorderStyleRoundedRect;
        
        searchField.leftView = searchIcon;
        
        searchField.leftViewMode = UITextFieldViewModeAlways;

        searchField.tintColor = [UIColor whiteColor];
        
        searchField;
        
    });
    
    [self addSubview:_searchField];
    

    
    
}

- (void)dateSelectButton
{

    UIButton *dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [dateButton setImage:[UIImage imageNamed:@"search_ic_date@3x.png"] forState:UIControlStateNormal];
    
    dateButton.titleLabel.font = [UIFont systemFontOfSize:11.0];
    
    dateButton.frame = CGRectMake(5, 5, self.frame.size.height, self.frame.size.height - 10);
    
    [dateButton setTitle:@"2016/12/12" forState:UIControlStateNormal];
    
    [dateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [dateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [dateButton addTarget:self action:@selector(dateButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [dateButton setImageEdgeInsets:UIEdgeInsetsMake(-12, 10, 0, 0)];
    
    [dateButton setTitleEdgeInsets:UIEdgeInsetsMake(38, -40, 0, 0)];
    
    [self addSubview:dateButton];
}

- (void)dateButtonClick
{
    if (_dateButtonBlock) {
        
        _dateButtonBlock();
    }
}




@end
