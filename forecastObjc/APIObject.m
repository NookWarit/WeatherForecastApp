//
//  APIObject.m
//  forecastObjc
//
//  Created by Foodstory on 16/3/2564 BE.
//

#import "APIObject.h"

@implementation APIObject
+(APIObject *) createAPIObject:(NSDictionary *)dict{
    APIObject *apiObj = [[APIObject alloc]init];
    
    apiObj.mainAPI = [MainObject mainWithDictionary:[dict objectForKey:@"main"]];
    NSArray *arrays = [dict objectForKey:@"weather"];
    
    WeatherObject *object = [[WeatherObject alloc] init];
    for (NSDictionary *weather in arrays) {
       
        object.main = [weather objectForKey:@"main"];
        object.descrip = [weather objectForKey:@"description"];
        object.icon = [weather objectForKey:@"icon"];
    }
    apiObj.weatherAPI = object;
    apiObj.sysApi = [SysObject sysWithDictionary:[dict objectForKey:@"sys"]];
    
    return  apiObj;
}

@end

@implementation CurrentObject


@end

@implementation MainObject
+(MainObject *)mainWithDictionary:(NSDictionary *)dict{
    MainObject *oo = [[MainObject alloc] init];
    oo.feels_like = [[dict objectForKey:@"feels_like"] doubleValue];
    oo.humidity = [[dict objectForKey:@"humidity"] intValue];
    oo.pressure = [[dict objectForKey:@"pressure"] intValue];
    oo.temp = [[dict objectForKey:@"temp"] doubleValue];
    oo.temp_max = [[dict objectForKey:@"temp_max"] doubleValue];
    oo.temp_min = [[dict objectForKey:@"temp_min"] doubleValue];
    return oo;
}

@end

@implementation WeatherObject
//+ (NSMutableArray *)weatherInArray:(NSArray *)array{
//    WeatherObject *newarray = [[WeatherObject alloc] init];
//    for (NSDictionary *dict in array) {
////        [newarray addObject:[WeatherObject weatherWithDictionary:dict]];
//    }
//    return newarray;
//}
//
//+ (WeatherObject *)weatherWithDictionary:(NSDictionary *)dict {
//
//    WeatherObject *wtobj = [[WeatherObject alloc] init];
//    wtobj.main = [dict objectForKey:@"main"];
//    wtobj.descrip = [dict objectForKey:@"description"];
//    return wtobj;
//}

@end

@implementation SysObject
+(SysObject *)sysWithDictionary:(NSDictionary *)dict{
    SysObject *oo = [[SysObject alloc] init];
    oo.country = [dict objectForKey:@"country"];
    return oo;
}

@end
