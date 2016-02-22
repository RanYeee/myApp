//
//  lineView.m
//  myApp
//
//  Created by IMac on 16/2/22.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "lineView.h"

@interface lineView ()
{
    
    CGPoint _fristPoint;
    
    CGPoint _movePoint;
    
    UIPushBehavior *_push;
    
    UIView *_box;
    
    UIDynamicAnimator *_animator;
    
    
}

@end

@implementation lineView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _box = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
        _box.backgroundColor = [UIColor grayColor];
        
        [self addSubview:_box];
        
        UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
        
        blueView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:blueView];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        
        [self addGestureRecognizer:pan];
        
        _push = [[UIPushBehavior alloc]initWithItems:@[_box] mode:UIPushBehaviorModeInstantaneous];
        
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
        
        [_animator addBehavior:_push];
        
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[_box,blueView]];
        
        [_animator addBehavior:collision];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self];
}

@end
