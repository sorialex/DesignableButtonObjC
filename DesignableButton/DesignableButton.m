//
//  DesignableButton.m
//  DesignableButton
//
//  Created by Alex S on 5/4/16.
//  Copyright © 2016 SoriAlex. All rights reserved.
//

#import "DesignableButton.h"


@interface DesignableButton ()

@property (nonatomic) IBInspectable CGFloat verticalSpacing;
@property (nonatomic) IBInspectable UIColor *highlightedColor;

@end

@implementation DesignableButton

- (void)prepareForInterfaceBuilder
{
    [self alignImageAndTitle];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self alignImageAndTitle];
}

- (void)alignImageAndTitle
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGFloat finalVerticalSpacing = self.verticalSpacing ? self.verticalSpacing : 2.0;
    CGFloat totalHeight = (imageSize.height + titleSize.height + finalVerticalSpacing);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];

    self.backgroundColor = highlighted ? self.highlightedColor : [UIColor whiteColor];
}

@end
