//
//  detailViewController.m
//  CoinGecko
//
//  Created by Shafiq Shovo on 27/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "detailViewController.h"
@interface detailViewController ()
 
@end

@implementation detailViewController

- (void)viewDidLoad {

    [super viewDidLoad];
  //  NSLog(@"%@",_value);
    //NSLog(@"aaaaaaaa %@",_identity);
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_rightLabel1.text = self->_value[@"name"];
  
    
            NSString *temp= [[self->_value valueForKey:@"market_cap_rank"]description];
            self->_rightLabel2.text = temp;
    
            temp= [ [self->_value valueForKey:@"total_supply"]description ];

            self->_rightLable3.text = temp;

            temp= [ [self->_value valueForKey:@"current_price"]description ];
    CGFloat val = [ temp floatValue];
    
    
    temp = [ NSString stringWithFormat:@"%.12f",val];
            self->_rightLabel4.text = temp;
    
            temp= [ [self->_value valueForKey:@"price_change_24h"]description ];
            self->_rightLable5.text = temp;
    
            temp= [ [self->_value valueForKey:@"last_updated"]description ];
            //self->_rightLable6.text = temp;
   
            NSString *str = self->_value[@"image"];
    
    
    //NSData * data = [[NSData alloc] initWithContentsOfURL:url];
   // _aimageView.image= [UIImage imageWithData: data];
            [self.indicator startAnimating];
            NSLog(@"%@",_identity);
            NSString *str1 = @"https://api.coingecko.com/api/v3/coins/";
            str1= [str1 stringByAppendingString:_identity];
            NSURL *url = [ NSURL URLWithString:str1];
           [ [ NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
               
               NSError *err;
               
               NSArray *items = [ NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
               
               if(err)
               {
                   NSLog(@"Failed to serialize into JSON: %@",err);
                   return;
                   
                   
               }
               NSLog(@"%@",items);
               NSDictionary *dict = [items valueForKey:@"description"];
              NSLog(@"%@",dict);
               NSString *val = dict [@"en"];
               NSLog(@"%@",dict);
               dispatch_async(dispatch_get_main_queue(), ^{
                   
              [self.indicator stopAnimating];
              [self.aWebView loadHTMLString:val baseURL:nil];
              [self.indicator removeFromSuperview];
               });
            
             }] resume ];
        });
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
