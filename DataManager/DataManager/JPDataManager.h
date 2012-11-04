//
//  JPDataManager.h
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPDataManager : NSObject <RenrenDelegate>

@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, strong) NSMutableArray *friendsList;
@property (nonatomic, strong) NSMutableDictionary *idMapping;

@property (nonatomic, strong) NSArray *publicCarrots;
@property (nonatomic, strong) NSArray *privateCarrots;
@property (nonatomic, strong) NSMutableDictionary *publicCarrotsDict;
@property (nonatomic, strong) NSMutableDictionary *privateCarrotsDict;

+ (JPDataManager *)sharedInstance;
- (id)init;

- (void)RenrenLogin;
- (void)RenrenLogout;
- (void)getFriendsList;
//- (NSArray *)refreshCarrot;
- (NSArray *)getGeneralPublicCarrotsWithNumber:(int)number;
- (NSArray *)getGeneralPrivateCarrotsWithUid:(NSString *)uid;
- (JPCarrot *)getDetailPublicCarrotWithCarrotID:(NSString *)carrotID;
- (JPCarrot *)getDetailPrivateCarrotWithCarrotID:(NSString *)carrotID;
//- (NSArray *)getPublicCarrots;
//- (NSArray *)getPrivateCarrots;
- (void)sendACarrotToServe:(JPCarrot*)carrot;

@end
