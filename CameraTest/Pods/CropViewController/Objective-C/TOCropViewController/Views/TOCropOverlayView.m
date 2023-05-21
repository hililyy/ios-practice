//
//  TOCropOverlayView.m
//
//  Copyright 2015-2022 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TOCropOverlayView.h"

static const CGFloat kTOCropOverLayerCornerWidth = 20.0f;

@interface TOCropOverlayView ()

@property (nonatomic, strong) NSArray *outerLineViews;   //top, right, bottom, left

@property (nonatomic, strong) NSArray *topLeftLineViews; //vertical, horizontal
@property (nonatomic, strong) NSArray *bottomLeftLineViews;
@property (nonatomic, strong) NSArray *bottomRightLineViews;
@property (nonatomic, strong) NSArray *topRightLineViews;

@end

@implementation TOCropOverlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = NO;
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIImageView *topLeft = [self createNewLineView:@"ic_top_left"];
    UIImageView *topRight = [self createNewLineView:@"ic_top_right"];
    UIImageView *bottomLeft = [self createNewLineView:@"ic_bottom_left"];
    UIImageView *bottomRight = [self createNewLineView:@"ic_bottom_right"];
    UILabel *messageLabel = [self createNewLabel];


    CGFloat labelWidth = 200;
    CGFloat labelHeight = 21;

    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (@available(iOS 9.0, *)) {
        [NSLayoutConstraint activateConstraints:@[
            [messageLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            [messageLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant: -(41+labelHeight)],
            [messageLabel.widthAnchor constraintEqualToConstant: labelWidth],
            [messageLabel.heightAnchor constraintEqualToConstant: labelHeight]
        ]];
    }
    
    _outerLineViews     = @[topLeft, topRight, bottomLeft, bottomRight];
    
    _topLeftLineViews   = @[topLeft];
    _bottomLeftLineViews = @[bottomLeft];
    _topRightLineViews  = @[topRight];
    _bottomRightLineViews = @[bottomRight];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (_outerLineViews) {
        [self layoutLines];
    }
}
- (void)layoutLines
{
    CGSize boundsSize = self.bounds.size;
    
    //corner liness
    NSArray *cornerLines = @[self.topLeftLineViews, self.topRightLineViews, self.bottomRightLineViews, self.bottomLeftLineViews];
    for (NSInteger i = 0; i < 4; i++) {
        NSArray *cornerLine = cornerLines[i];
        
        CGRect verticalFrame = CGRectZero;
        switch (i) {
            case 0: //top left
                verticalFrame = (CGRect){-13.0f, -13.0f, 26.0f, 26.0f};
                break;
            case 1: //top right
                verticalFrame = (CGRect){boundsSize.width-13.0f, -13.0f, 26.0f, 26.0f};
                break;
            case 2: //bottom right
                verticalFrame = (CGRect){boundsSize.width-13.0f, boundsSize.height-13.0f, 26.0f, 26.0f};
                break;
            case 3: //bottom left
                verticalFrame = (CGRect){-13.0f, boundsSize.height-13.0f, 26.0f, 26.0f};
                break;
        }
        
        [cornerLine[0] setFrame:verticalFrame];
    }
}

#pragma mark - Private methods

- (nonnull UIImageView *)createNewLineView:(NSString*)imageName {
    UIImageView *newLine = [[UIImageView alloc] initWithFrame:CGRectZero];
    newLine.image = [UIImage imageNamed: imageName];
    [self addSubview:newLine];
    return newLine;
}

- (nonnull UILabel *)createNewLabel {
    UILabel *newMessage = [[UILabel alloc] initWithFrame:CGRectZero];
    newMessage.text = @"한 문제만 잘라주세요.";
    newMessage.textColor = UIColor.whiteColor;
    newMessage.textAlignment = NSTextAlignmentCenter;
    [self addSubview:newMessage];
    return newMessage;
}

@end
