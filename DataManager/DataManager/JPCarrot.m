//
//  JPCarrot.m
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import "JPCarrot.h"
#import <Parse/Parse.h>

@implementation JPCarrot

@synthesize carrotID;
@synthesize longitude;
@synthesize latitude;
@synthesize message;
@synthesize isPublic;
@synthesize senderID;
@synthesize receiverID;
@synthesize sendedTime;

- (id) initPrivateCarrotWithLogitude:(NSString*)argLongitude withLatitude:(NSString*)argLatitude withMessage:(NSString*)argMessage withSenderID:(NSString*)argSenderID withReceiverID:(NSArray*)argReceiverID withSendedTime:(NSString*)argSendedTime
{
    self = [super init];
    if (self) {
        self.carrotID = [NSString stringWithFormat:@"%@ %@", argSenderID, argSendedTime];
        self.longitude = [argLongitude floatValue];
        self.latitude = [argLongitude floatValue];
        self.message = argMessage;
        self.isPublic = NO;
        self.senderID = argSenderID;
        self.receiverID = argReceiverID;
        self.sendedTime = argSendedTime;
    }
    return self;
}

- (id) initPublicCarrotWithLogitude:(NSString*)argLongitude withLatitude:(NSString*)argLatitude withMessage:(NSString*)argMessage withSenderID:(NSString*)argSenderID withSendedTime:(NSString*)argSendedTime
{
    self = [super init];
    if (self) {
        self.carrotID = [NSString stringWithFormat:@"%@ %@", argSenderID, argSendedTime];
        self.longitude = [argLongitude floatValue];
        self.latitude = [argLongitude floatValue];
        self.message = argMessage;
        self.isPublic = YES;
        self.senderID = argSenderID;
        self.sendedTime = argSendedTime;
    }
    return self;
}

- (id) initWithPFObject:(PFObject*)PFObject
{
    NSLog(@"%@",PFObject);
    if ([PFObject objectForKey:@"receiverID"])
        self = [self initPrivateCarrotWithLogitude:[PFObject objectForKey:@"longitude"]
                                          withLatitude:[PFObject objectForKey:@"latitude"]
                                          withMessage:[PFObject objectForKey:@"message"]
                                          withSenderID:[PFObject objectForKey:@"senderID"]
                                          withReceiverID:[PFObject objectForKey:@"receiverID"]
                                          withSendedTime:[PFObject objectForKey:@"sendedTime"]];
        
    else
        self = [self initPublicCarrotWithLogitude:[PFObject objectForKey:@"longitude"]
                                         withLatitude:[PFObject objectForKey:@"latitude"]
                                         withMessage:[PFObject objectForKey:@"message"]
                                         withSenderID:[PFObject objectForKey:@"senderID"]
                                         withSendedTime:[PFObject objectForKey:@"sendedTime"]];
    NSLog(@"%@",self.carrotID);
    //NSLog(@"%@",[PFObject objectForKey:@"objectId"]);
    return self;
}

- (NSString *)description
{
    NSString *str = [NSString stringWithFormat:@"Carrot\n[[\tcarrotID : %@\n\tlongitude : %f\n\tlatitude : %f\n\tmessage : %@\n\tisPublic : %d\n\tsenderID : %@\n\treceiverID : %@\n\tsendedTime : %@\n]]", self.carrotID, self.longitude, self.latitude, self.message, self.isPublic, self.senderID, self.receiverID, self.sendedTime];
    return str;
}

@end
