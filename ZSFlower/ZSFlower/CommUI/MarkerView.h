//
//  MarkerView.h
//  ZSFlower
//
//  Created by 左笑林 on 15-5-18.//
//

#import <UIKit/UIKit.h>

@protocol MarkerViewDelegate <NSObject>
- (void) markerViewDidSelectedStar:(NSInteger)star withType:(markingType )type;
@end

@interface MarkerView : UIView
@property (nonatomic, assign) NSInteger          selectedIndex;
@property (nonatomic, assign) id<MarkerViewDelegate> delegate;
@property(nonatomic,assign)markingType currentType;
- (id)initWithFrame:(CGRect)frame withType:(markingType)type;
@end
