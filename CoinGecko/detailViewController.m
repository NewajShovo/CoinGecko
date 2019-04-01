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
@synthesize ascrollView;
- (void)viewDidLoad {

    [super viewDidLoad];
    [ascrollView setScrollEnabled:NO];
    self.secondView.backgroundColor=[ UIColor lightGrayColor];
    ///[ascrollView setContentSize:CGSizeMake(375,650)];
  //  NSLog(@"%@",_value);
    //NSLog(@"aaaaaaaa %@",_identity);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            self->_rightLabel1.text = self->_value[@"name"];
            NSLog(@"%@",_value[@"name"]);
  
    
            NSString *temp= [[self->_value valueForKey:@"market_cap_rank"]description];
            self->_rightLable2.text = temp;
    
            temp= [ [self->_value valueForKey:@"total_supply"]description ];

          /*
            self->_rightLable3.text = temp;

            temp= [ [self->_value valueForKey:@"current_price"]description ];
    CGFloat val = [ temp floatValue];
    
    
    temp = [ NSString stringWithFormat:@"%.12f",val];
            self->_rightLabel4.text = temp;
    
            temp= [ [self->_value valueForKey:@"price_change_24h"]description ];
            self->_rightLable5.text = temp;
    
            temp= [ [self->_value valueForKey:@"last_updated"]description ];
            //self->_rightLable6.text = temp;
           */
   
            NSString *str = self->_value[@"image"];
    
            NSLog(@"%@",str);
            NSURL *url1 = [ NSURL URLWithString:str];
        NSData * data = [[NSData alloc] initWithContentsOfURL:url1];
        _Image.image= [UIImage imageWithData: data];
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
                   

           
                   
                   
                   NSLog(@"----- %f", self.awebview.scrollView.contentSize.height);
                   [self.awebview loadHTMLString:val baseURL:nil];
                   [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
                         [self.indicator stopAnimating];
                       [self.indicator removeFromSuperview];
                       
                       CGSize mWebViewTextSize = [_awebview sizeThatFits:CGSizeMake(1.0f, 1.0f)]; // Pass about any size
                       CGRect mWebViewFrame = _awebview.frame;
                       mWebViewFrame.size.height = mWebViewTextSize.height;
                       self->_awebview.frame = mWebViewFrame;
                       NSLog(@"----- %f", self.awebview.scrollView.contentSize.height);
                       self->_awebview.frame = CGRectMake(self.awebview.frame.origin.x, self.awebview.frame.origin.y, self.awebview.frame.size.width, self->_awebview.scrollView.contentSize.height);
                      
                       self.ViewHeight.constant=self->_awebview.scrollView.contentSize.height;
                       NSLog(@"asdfasdfasdf %f", self.awebview.frame.size.height);
                       NSLog(@"asdfasdfasdf %f", self.awebview.frame.size.width);
                       
                       
                       
                   }];
                   
                   
           
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
