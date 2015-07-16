//
//  DAMessageIndicator.h
//  Pods
//
//  Created by 陈婧婷 on 15/7/16.
//
//

#import <UIKit/UIKit.h>
#import "M13BadgeView.h"

@interface DAMessageIndicator : UIView
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UIImageView *failureImage;
@property (nonatomic, strong) M13BadgeView *badgeView;

-(void)showMessageSending;
-(void)stopMessageSending;
-(void)showMessageFailure;
-(void)showMessageSuccess:(int)tag;
@end
