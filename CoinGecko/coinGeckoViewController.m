//
//  coinGeckoViewController.m
//  CoinGecko
//
//  Created by Shafiq Shovo on 27/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "coinGeckoViewController.h"
#import "detailViewController.h"
//#import "PINViewController.h"

//#import <PINRemoteImage/PINRemoteImage.h>
//#import <PINRemoteImage/PINImageView+PINRemoteImage.h>
//#import <PINRemoteImage/PINRemoteImageCaching.h>

@interface coinGeckoViewController ()

@end

@implementation coinGeckoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataItems = [ [ NSMutableArray alloc] init];
    displayItems = [ [ NSMutableArray alloc] init];
    parentDictionary = [ [ NSMutableArray alloc] init];
//    activityIndicator= [ [ UIActivityIndicatorView alloc] init];
    //super.viewDidLoad()
    Url = [ [ NSMutableArray alloc] init];
        [self fetchDataUsingJson];
    [atableView registerClass:[CustomTableCell class] forCellReuseIdentifier:NSStringFromClass([CustomTableCell class])];
    [self->activityIndicator setHidesWhenStopped:true];
    [self->activityIndicator startAnimating];

//    [activityIndicator removeFromSuperview];
}



#pragma mark - this method parsing json data;

- (void) fetchDataUsingJson{
    NSLog(@"Hello");
    
    
    NSString *urlString =@"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";
    
    
    NSURL *url = [ NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
   // NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [ [ NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Code running Here");
        NSString *dummyString = [[ NSString alloc]  initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"Dummy String: %@",dummyString);
        
        NSError *err;
        
        NSArray *items = [ NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if(err)
        {
            NSLog(@"Failed to serialize into JSON: %@",err);
            return;
            
            
        }
        NSLog(@"*****************************************");
        // NSLog(@"%@",items[0].name);
        int i=1;
        for (NSDictionary *dataDict in items)
        {
            NSString *name = dataDict[ @"name"];
            NSString *Id = dataDict [ @"id"];
            NSString *img= dataDict [@"image"];
            NSURL *url = [ NSURL URLWithString:img];
            [self->dataItems addObject:Id];
            [self->parentDictionary addObject:dataDict];
            [self->displayItems addObject:name];
            [self -> Url addObject:url];

            i++;
            if( i> 100) break;
            
        }
    
       
       
        dispatch_async(dispatch_get_main_queue(), ^{
           
                [self->atableView reloadData];
            [self->activityIndicator stopAnimating];

        });
        
        
        
    }] resume ];
    
    NSLog(@"DONEE");
    NSLog(@"%@",parentDictionary);
    
    
}



- (instancetype) init
{
 
    self = [ super init];
    if (self)
    {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"CoinGecko";
    }
    
    return self;
    
}

# pragma mark - for table view added
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [displayItems count];
}

- (UITableViewCell *) tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomTableCell *cell = [atableView dequeueReusableCellWithIdentifier:@"Cell"];
   // [cell AmiShuvo];
    // NSLog(@"how are you");
    if(!cell)
    {
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    }
    NSDictionary *temp = parentDictionary[indexPath.row];
    
    NSURL *url = Url[ indexPath.row];
    cell.textLabel.text = temp[@"name"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",temp[@"name"]]]; //Add the file name
//    [pngData writeToFile:filePath atomically:YES]; //Write the file
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]){
        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];
    }
    else{
        
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                //            UIImage *image = [UIImage imageWithData:data];
                BOOL success = [data writeToFile:filePath atomically:YES];
                if (success) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //                    UIImageView *imageView = [[UIImageView alloc] init];
                        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];
                    });
                }
            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imageView.image = nil;
                });
            }
        }];
        [task resume];
    }
    
    return cell;
    
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSDictionary *temp =  parentDictionary[indexPath.row];
    
    detailViewController *detailView = [ [ detailViewController alloc ] init] ;
    
    detailView.value = temp;
    detailView.identity = temp[@"id"];
    [ self.navigationController pushViewController:detailView animated:YES];
    
}

@end

@implementation CustomTableCell

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
