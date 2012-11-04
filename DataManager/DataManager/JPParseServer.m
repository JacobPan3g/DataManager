//
//  JPParseServer.m
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import "JPParseServer.h"
#import "JPDataManager.h"

@implementation JPParseServer

@synthesize testI;

- (void)sendACarrotToSever:(JPCarrot*)carrot
{
    PFObject *dataRecord;
    if (carrot.isPublic)
        dataRecord = [PFObject objectWithClassName:@"PublicCarrot"];
    else {
        dataRecord = [PFObject objectWithClassName:@"PrivateCarrot"];
        [dataRecord setObject:carrot.receiverID forKey:@"receiverID"];
    }
    [dataRecord setObject:[NSNumber numberWithFloat:carrot.longitude] forKey:@"longitude"];
    [dataRecord setObject:[NSNumber numberWithFloat:carrot.latitude] forKey:@"latitude"];
    [dataRecord setObject:carrot.message forKey:@"message"];
    [dataRecord setObject:carrot.senderID forKey:@"senderID"];
    [dataRecord setObject:carrot.sendedTime forKey:@"sendedTime"];
    [dataRecord saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Success!");
            testI++;
            
//            NSNotification *ntf = [NSNotification notificationWithName:@"sendSuccessed" object:self];
//            NSNotificationCenter *ntfCenter = [NSNotificationCenter defaultCenter];
//            [ntfCenter postNotification:ntf];
        }
        else {
            NSLog(@"您的网络状况不好，数据上传不成功");
        }
    }];
    
}

- (JPCarrot*)getAPublicDetialCarrot:(NSString*)carrotID
{
    PFQuery *dataTable = [PFQuery queryWithClassName:@"PrublicCarrot"];
    PFObject *dataRecord = [dataTable getObjectWithId:carrotID];
    JPCarrot *carrot = [[JPCarrot alloc]
                        initPublicCarrotWithLogitude:[dataRecord objectForKey:@"longitude"]
                        withLatitude:[dataRecord objectForKey:@"latitude"]
                        withMessage:[dataRecord objectForKey:@"message"]
                        withSenderID:[dataRecord objectForKey:@"senderID"]
                        withSendedTime:[dataRecord objectForKey:@"SendTime"]];
    [dataRecord deleteInBackground];
    return carrot;
}

- (JPCarrot*)getAPrivateDetialCarrot:(NSString*)carrotID
{
    PFQuery *dataTable = [PFQuery queryWithClassName:@"PrivateCarrot"];
    PFObject *dataRecord = [dataTable getObjectWithId:carrotID];
    JPCarrot *carrot = [[JPCarrot alloc]
                        initPrivateCarrotWithLogitude:[dataRecord objectForKey:@"longitude"]
                        withLatitude:[dataRecord objectForKey:@"latitude"]
                        withMessage:[dataRecord objectForKey:@"message"]
                        withSenderID:[dataRecord objectForKey:@"senderID"]
                        withReceiverID:[dataRecord objectForKey:@"receiverID"]
                        withSendedTime:[dataRecord objectForKey:@"SendTime"]];
    [dataRecord deleteInBackground];
    return carrot;
}
/*
- (NSArray*)getGeneralPublicCarrotsWithRange:(float)range withLongitude:(float)longitude WithLatitude:(float)latitude
{
    PFQuery *upperLongitude = [PFQuery queryWithClassName:@"PublicCarrot"];
    [upperLongitude whereKey:@"longitude" lessThan:[NSNumber numberWithFloat:longitude+range]];
    PFQuery *lowerLongitude = [PFQuery queryWithClassName:@"PublicCarrot"];
    [lowerLongitude whereKey:@"longitude" lessThan:[NSNumber numberWithFloat:longitude-range]];
    PFQuery *upperLatitude = [PFQuery queryWithClassName:@"PublicCarrot"];
    [upperLatitude whereKey:@"latitude" lessThan:[NSNumber numberWithFloat:latitude+range]];
    PFQuery *lowerLatitude = [PFQuery queryWithClassName:@"PublicCarrot"];
    [lowerLatitude whereKey:@"latitude" lessThan:[NSNumber numberWithFloat:latitude-range]];
    
    PFQuery *dataTable = [PFQuery orQueryWithSubqueries:[NSArray arrayWithObjects:upperLongitude, lowerLongitude, upperLatitude, lowerLatitude, nil]];
    NSArray *carrots = [dataTable findObjects];
    return carrots;
    
}*/

/*
//在这遇到了一个纠结的东东
- (NSArray)getGeneralPublicCarrotsWithNum:(int)number
{
    PFQuery *dataTable = [PFQuery queryWithClassName:@"PublicCarrot"];
    dataTable.limit = number;
    //[dataTable addDescendingOrder:@"sendedTime"];

    [dataTable findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Get Success!");
            NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
            
            
            for ( PFObject *item in objects ) {
                JPCarrot *carrot = [[JPCarrot alloc] initPublicCarrotWithLogitude:[item objectForKey:@"longitude"]
                                                                    withLatitude:[item objectForKey:@"latitude"]
                                                                    withMessage:[item objectForKey:@"message"]
                                                                    withSenderID:[item objectForKey:@"senderID"]
                                                                    withSendedTime:[item objectForKey:@"sendedID"]];
                [tmpArr addObject:carrot];
            }
            NSLog(@"%d", [tmpArr count]);
            NSLog(@"%d", [[JPDataManager sharedInstance].publicCarrot count]);
        }
        else {
            NSLog(@"您的网络状态不太理想，数据上传不成功，请重试");
        }
    }];

}*/

- (NSArray*)getGeneralPublicCarrotsWithNum:(int)number
{
    PFQuery *dataTable = [PFQuery queryWithClassName:@"PublicCarrot"];
    dataTable.limit = number;
    [dataTable addDescendingOrder:@"sendedTime"];
    NSError *error = [[[NSError alloc] init] autorelease];
    NSArray *carrots = [dataTable findObjects:&error];
    if (error)
        NSLog(@"Error");
    return carrots;
}

- (NSArray*)getGeneralPrivateCarrots:(NSString*)uid
{
    PFQuery *dataTable = [PFQuery queryWithClassName:@"PrivateCarrot"];
    NSString *regule = [NSString stringWithFormat:@".*%@.*", uid];
    [dataTable whereKey:@"senderID" matchesRegex:regule];
    NSArray *carrots = [dataTable findObjects];
    return carrots;
}

@end
