//
//  MarkerView.m
//  ZSFlower
//
//  Created by 左笑林 on 15-5-18.
//
//

#import "MarkerView.h"
#import "Utility.h"

@implementation MarkerView
@synthesize selectedIndex = _selectedIndex;
@synthesize delegate      = _delegate;

- (void)setStarWithPoint:(CGPoint)pt {
    
    for (UIImageView *imageView in [self subviews]) {
        if ([Utility point:pt inRect:imageView.frame]) {
            _selectedIndex = imageView.tag;
            break;
        }
    }
    if (_selectedIndex == 0) {
        return;
    }
    for (UIImageView *imageView in [self subviews]) {
        if (imageView.tag <= _selectedIndex) {
            imageView.image = IMGNAMED(@"personal__Evaluation_red");
        } else {
            imageView.image = IMGNAMED(@"personal__Evaluation_gray");
        }
    }
    
    if ([_delegate respondsToSelector:@selector(markerViewDidSelectedStar:withType:)]) {
        [_delegate markerViewDidSelectedStar:_selectedIndex withType:_currentType];
    }
}

- (id)initWithFrame:(CGRect)frame withType:(markingType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        int xOffset = 10;
        _currentType = type;
        for (int i=1;i<=5;i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:IMGNAMED(@"personal__Evaluation_gray")];
            imageView.tag = i;
            imageView.left = xOffset+10*(i-1);
            imageView.top = (frame.size.height-imageView.height)/2;
            [self addSubview:imageView];
            xOffset += imageView.width;
        }
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setStarWithPoint:[[touches anyObject] locationInView:self]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setStarWithPoint:[[touches anyObject] locationInView:self]];
}


@end
