//
//  DAMessageIndicator.m
//  Pods
//
//  Created by 陈婧婷 on 15/7/16.
//
//

#import "DAMessageIndicator.h"

#define POIColorGreenDark  [UIColor colorWithRed:22/255.0 green:160/255.0 blue:133/255.0 alpha:1.0]


@implementation DAMessageIndicator

@synthesize spinner;
@synthesize badgeView;
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.failureImage = nil;
        
        [self addSubview:self.spinner];
    }
    return self;
}
-(void)awakeFromNib
{
    self.spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.failureImage = nil;
    [self addSubview:self.spinner];
    
}
-(void)showMessageSending
{
    self.failureImage.hidden = YES;
    self.spinner.center = CGPointMake(10, 10);
    [self.spinner startAnimating];
}


-(void)stopMessageSending
{
    [self.spinner stopAnimating];
}

-(void)showMessageFailure
{
    self.failureImage.hidden = NO;
    if (self.failureImage == nil) {
        self.failureImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.failureImage.contentMode = UIViewContentModeScaleAspectFill;
        self.spinner.center = CGPointMake(10, 10);
        [self addSubview:self.failureImage];
    }
    
    self.failureImage.image = [UIImage imageNamed:@"message_alert.png"];
    
}

-(void)showMessageSuccess:(int)tag
{
    self.failureImage.hidden = NO;
    if (self.failureImage == nil) {
        
        
        self.badgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
        self.badgeView.hidesWhenZero = 0;
        self.badgeView.text = @"0";
        self.badgeView.badgeBackgroundColor = POIColorGreenDark;
        [self.badgeView setFont:[UIFont systemFontOfSize:11]];
        [self addSubview:self.badgeView];
        self.badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
        
    }
    self.badgeView.text = [NSString stringWithFormat:@"答案%d",(tag+1)];
}
@end
