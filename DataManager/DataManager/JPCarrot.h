//
//  JPCarrot.h
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface JPCarrot : NSObject

@property (nonatomic, strong) NSString *carrotID;
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;
@property (nonatomic, strong) NSString *message;
@property (nonatomic) BOOL isPublic;
@property (nonatomic, strong) NSString *senderID;
@property (nonatomic, strong) NSArray *receiverID;
@property (nonatomic, strong) NSString *sendedTime;

- (id) initPrivateCarrotWithLogitude:(NSString*)argLongitude
                        withLatitude:(NSString*)argLatitude
                        withMessage:(NSString*)argMessage
                        withSenderID:(NSString*)argSenderID
                        withReceiverID:(NSArray*)argReceiverID
                        withSendedTime:(NSString*)argSendedTime;

- (id) initPublicCarrotWithLogitude:(NSString*)argLongitude
                       withLatitude:(NSString*)argLatitude
                       withMessage:(NSString*)argMessage
                       withSenderID:(NSString*)argSenderID
                       withSendedTime:(NSString*)argSendedTime;

- (id) initWithPFObject:(PFObject*)PFObject;

@end
