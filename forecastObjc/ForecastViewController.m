//
//  ForecastViewController.m
//  forecastObjc
//
//  Created by Foodstory on 17/3/2564 BE.
//

#import "ForecastViewController.h"

@interface ForecastViewController ()

@end

@implementation ForecastViewController

@synthesize cityname;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getAPI:<#(NSString *)#>]
}

- (void)getAPI:(NSString *)cityName{
    __weak typeof(self) weakSelf = self;
    NSString *cityID = cityName;
   NSString *apiKey = @"8035774fb87fb4a014437858e5ed122f";
   NSString *address = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?q=%@&appid=%@",cityID, apiKey];
   // Send an ASYNCHRONOUS request

   NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:address]];
   [[[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//       NSLog(@"%d",[NSThread isMainThread]);
      if (error) {
         NSLog(@"%@", error);
      } else {
         NSError * jsonError = nil;
         if (jsonError) {
            NSLog(@"%@", jsonError);
             
         } else {
             NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
             NSLog(@"%@", dictionary);
             
             APIObject *apiObj = [APIObject createAPIObject:dictionary];
             
             double cc =  273.15;
             
             NSString *tempCC = [NSString stringWithFormat:@"%.0f",apiObj.mainAPI.temp - cc];
             NSString *tempMax = [NSString stringWithFormat:@"%.0f",apiObj.mainAPI.temp_max - cc];
             NSString *tempMin = [NSString stringWithFormat:@"%.0f",apiObj.mainAPI.temp_min - cc];

             NSString *icon = [NSString stringWithFormat:@"%@",apiObj.weatherAPI.icon];
             NSString *sizeIcon = [NSString stringWithFormat:@"@4x.png"];
             NSString *imgPath = [NSString stringWithFormat:@"http://openweathermap.org/img/wn//%@%@",icon,sizeIcon];
             
             NSString *name = [dictionary objectForKey:@"name"];
             NSString *country = [NSString stringWithFormat:@"%@,%@",name,apiObj.sysApi.country];
             dispatch_async(dispatch_get_main_queue(), ^{
//                 NSLog(@"%d",[NSThread isMainThread]);
//                 [weakSelf.myName setText:country];
//                 [weakSelf.myTemp setText:tempCC];
//                 [weakSelf.myTempMax setText:tempMax];
//                 [weakSelf.myTempMin setText:tempMin];
//                 [weakSelf.img sd_setImageWithURL:[NSURL URLWithString: imgPath]];
//                 [weakSelf.myWeather setText:apiObj.weatherAPI.main];
//                 [weakSelf.myDescription setText:apiObj.weatherAPI.descrip];
             });
         }
      }
   }] resume];
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
