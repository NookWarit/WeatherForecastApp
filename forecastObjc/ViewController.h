//
//  ViewController.h
//  forecastObjc
//
//  Created by Foodstory on 16/3/2564 BE.
//

#import <UIKit/UIKit.h>
#import "APIObject.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *myName;
@property (nonatomic, weak) IBOutlet UIImageView *img;
@property (nonatomic, weak) IBOutlet UILabel *myTemp;
@property (nonatomic, weak) IBOutlet UILabel *myTempMax;
@property (nonatomic, weak) IBOutlet UILabel *myTempMin;
@property (nonatomic, weak) IBOutlet UILabel *myWeather;
@property (nonatomic, weak) IBOutlet UILabel *myDescription;
@property (weak, nonatomic) IBOutlet UITextField *txt;
@property (weak, nonatomic) IBOutlet UICollectionView *dailycollectionView;

-(IBAction)buttonPressed;
-(IBAction)tomorrowBtnPressed;

@end

