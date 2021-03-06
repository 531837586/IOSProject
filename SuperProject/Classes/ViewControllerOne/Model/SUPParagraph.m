//
//  SUPParagraph.m
//  SuperProject
//
//  Created by NShunJian on 2018/4/20.
//  Copyright © 2018年 superMan. All rights reserved.
//

#import "SUPParagraph.h"

const CGFloat KTopSpace = 10;
const CGFloat KLeftSpace = 15;
const CGFloat KRightSpace = 15;
const CGFloat KDateLabelFontSize = 17;
const CGFloat KDateMarginToText = 10;
const CGFloat KTextLabelFontSize = 15;
const CGFloat kBottomSpace = 10;
@interface SUPParagraph()
{
    NSAttributedString *_attWords;
    CGFloat _height;
}
@end

@implementation SUPParagraph

- (NSAttributedString *)attWords
{
    if(!_attWords)
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 4;
        
        NSAttributedString *arrS = [[NSAttributedString alloc] initWithString:self.words attributes:@{NSFontAttributeName : AdaptedFontSize(KTextLabelFontSize), NSParagraphStyleAttributeName : paragraphStyle}];
        
        _attWords = arrS;
    }
    return _attWords;
}

- (CGFloat)height
{
    if(!_height)
    {
        _height += KTopSpace;
        _height += kBottomSpace;
        _height += KDateMarginToText;
        
       _height += [self.attWords boundingRectWithSize:CGSizeMake(kScreenWidth - KLeftSpace - KRightSpace, INFINITY) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
        
        _height += [self.date boundingRectWithSize:CGSizeMake(kScreenWidth - KLeftSpace - KRightSpace, INFINITY) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : AdaptedFontSize(KDateLabelFontSize)} context:nil].size.height;
    }
    return _height;
}

@end
