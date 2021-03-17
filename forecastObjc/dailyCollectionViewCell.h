//
//  dailyCollectionViewCell.h
//  forecastObjc
//
//  Created by Foodstory on 16/3/2564 BE.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface dailyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateTime;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *temp;

@end

NS_ASSUME_NONNULL_END
