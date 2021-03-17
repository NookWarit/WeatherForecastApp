//
//  APIObject.h
//  forecastObjc
//
//  Created by Foodstory on 16/3/2564 BE.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainObject : NSObject
@property (nonatomic, assign) int humidity,pressure;
@property (nonatomic, assign) double feels_like,temp,temp_max,temp_min;
+(MainObject *)mainWithDictionary:(NSDictionary *)dict;
@end

@interface WeatherObject : NSObject
@property (nonatomic, retain) NSString *main, *descrip, *icon;
//+(NSMutableArray *)weatherInArray:(NSArray *)array;
//+(WeatherObject *)weatherWithDictionary:(WeatherObject *)dict;
@end

@interface SysObject : NSObject
@property (nonatomic, retain) NSString *country;
+(SysObject *)sysWithDictionary:(NSDictionary *)dict;
@end

@interface CurrentObject : NSObject

@end

@interface APIObject : NSObject

@property (nonatomic,retain) MainObject *mainAPI;
@property (nonatomic,retain) WeatherObject *weatherAPI;
@property (nonatomic,retain) SysObject *sysApi;
+(APIObject *) createAPIObject:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
