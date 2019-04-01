//
//  detailViewController.h
//  CoinGecko
//
//  Created by Shafiq Shovo on 27/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "coinGeckoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface detailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

   @property (strong,readwrite) NSDictionary *value;
   @property (strong,readwrite) NSString *identity;

@property (weak, nonatomic) IBOutlet UIWebView *aWebView;
@property (strong, nonatomic) IBOutlet UIImageView *aimageView;

@property (weak, nonatomic) IBOutlet UILabel *leftLabel1;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel2;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel3;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel4;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel5;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel6;
///@property (strong, nonatomic) IBOutlet UIWebView *indicator;


@property (weak, nonatomic) IBOutlet UILabel *rightLabel1;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel2;
@property (weak, nonatomic) IBOutlet UILabel *rightLable3;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel4;
@property (weak, nonatomic) IBOutlet UILabel *rightLable5;
@property (weak, nonatomic) IBOutlet UILabel *rightLable6;




@end

NS_ASSUME_NONNULL_END
