//
//  coinGeckoViewController.h
//  CoinGecko
//
//  Created by Shafiq Shovo on 27/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailViewController.h"
NS_ASSUME_NONNULL_BEGIN
@interface coinGeckoViewController :UIViewController< UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate, NSURLConnectionDelegate>
{
   
    int chk;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    NSMutableData * responseData;
    IBOutlet UITableView *atableView;
    IBOutlet UISearchBar *aserchBar;

    NSMutableArray *dataItems; // we will use dataItem for storing Id;
    
    NSMutableArray *displayItems;  // data for showing in the cell;
    
    NSMutableArray *parentDictionary; // parent dictionary holds all the data after json parsing;
    NSMutableArray *Url;
    
    
}
@end

@interface coinGeckoViewController()

@end

@interface UITableViewCell (CustomCell)

- (void) AmiShuvo;

@end

@interface CustomTableCell : UITableViewCell

@end

NS_ASSUME_NONNULL_END
