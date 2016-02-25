//
//  CustomTextField.m
//  myApp
//
//  Created by IMac on 16/2/25.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    //控制placeHolder的位置，左右缩20

    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x+bounds.size.width/3, bounds.origin.y+2, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;

}

-(CGRect)leftViewRectForBounds:(CGRect)bounds
{
    
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y+10, 22, 22);
    
    return inset;
}

@end
