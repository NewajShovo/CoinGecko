//
//  detailViewController.h
//  CoinGecko
//
//  Created by Shafiq Shovo on 27/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "coinGeckoViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface detailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
//@property (strong, nonatomic) IBOutlet UIView *View;

   @property (strong,readwrite) NSDictionary *value;
   @property (strong,readwrite) NSString *identity;
@property (strong, nonatomic) IBOutlet UIScrollView *ascrollView;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel1;
@property (strong, nonatomic) IBOutlet UILabel *rightLable2;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel1;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel2;
@property (strong, nonatomic) IBOutlet UIWebView *awebview;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewHeight;
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIImageView *Image;

//@property (strong, nonatomic) IBOutlet NSLayoutConstraint *Height;

//@property (strong, nonatomic) WKWebView *wkWebview;


//@property (weak, nonatomic) IBOutlet UIWebView *aWebView;
//@property (strong, nonatomic) IBOutlet UIImageView *aimageView;
//
//@property (weak, nonatomic) IBOutlet UILabel *leftLabel1;
//@property (weak, nonatomic) IBOutlet UILabel *leftLabel2;
//@property (weak, nonatomic) IBOutlet UILabel *leftLabel3;
//@property (weak, nonatomic) IBOutlet UILabel *leftLabel4;
//@property (weak, nonatomic) IBOutlet UILabel *leftLabel5;
//@property (weak, nonatomic) IBOutlet UILabel *leftLabel6;
/////@property (strong, nonatomic) IBOutlet UIWebView *indicator;
//
//
//@property (weak, nonatomic) IBOutlet UILabel *rightLabel1;
//@property (weak, nonatomic) IBOutlet UILabel *rightLabel2;
//@property (weak, nonatomic) IBOutlet UILabel *rightLable3;
//@property (weak, nonatomic) IBOutlet UILabel *rightLabel4;
//@property (weak, nonatomic) IBOutlet UILabel *rightLable5;
//@property (weak, nonatomic) IBOutlet UILabel *rightLable6;




@end

NS_ASSUME_NONNULL_END
