//
//  JPDataManager.m
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import "JPDataManager.h"
#import "JPParseServer.h"

@interface JPDataManager ()
{
    JPParseServer *parseServer;
}

@end

@implementation JPDataManager

@synthesize userInfo;
@synthesize friendsList;
@synthesize idMapping;
@synthesize publicCarrots;
@synthesize privateCarrots;
@synthesize privateCarrotsDict;
@synthesize publicCarrotsDict;

+ (JPDataManager *)sharedInstance
{
    static JPDataManager *instance;
    
    @synchronized(self){
        if (!instance) {
            instance = [[JPDataManager alloc] init];
        }
    }
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        parseServer = [[JPParseServer alloc] init];
        self.friendsList = [[NSMutableArray alloc] init];
        self.idMapping = [[NSMutableDictionary alloc] init];
        self.publicCarrots = [[NSArray alloc] init];
        self.privateCarrots = [[NSArray alloc] init];
        self.publicCarrotsDict = [[NSMutableDictionary alloc] init];
        self.privateCarrotsDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)RenrenLogin
{
    [[Renren sharedRenren] authorizationWithPermisson:nil andDelegate:self];
}

- (void)RenrenLogout
{
    [[Renren sharedRenren] logout:self];
}

- (void)getFriendsList
{
    //拉取好友信息
    //设置参数，然后调用Renren单实例的方法就行了
    ROGetFriendsInfoRequestParam *requestParam_ = [[ROGetFriendsInfoRequestParam alloc] init];
	requestParam_.count = @"";   //当count变量为@“”时，才会拉到全部好友
    requestParam_.fields = @"id,name,tinyurl";
	[[Renren sharedRenren] getFriendsInfo:requestParam_ andDelegate:self];
}

- (NSArray *)getGeneralPublicCarrotsWithNumber:(int)number
{
    NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
    NSArray *PFObjectArr = [parseServer getGeneralPublicCarrotsWithNum:number];
    for ( PFObject *item in PFObjectArr ) {
        JPCarrot *carrot = [[JPCarrot alloc] initWithPFObject:item];
        [tmpArr addObject:carrot];
        [self.publicCarrotsDict setObject:carrot forKey:carrot.carrotID];
    }
    self.publicCarrots = tmpArr;
    NSLog(@"%d", [self.publicCarrotsDict count]);
    return tmpArr;
}

- (NSArray *)getGeneralPrivateCarrotsWithUid:(NSString *)uid
{
    NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
    NSArray *PFObjectArr = [parseServer getGeneralPrivateCarrots:uid];
    for ( PFObject *item in PFObjectArr ) {
        JPCarrot *carrot = [[JPCarrot alloc] initWithPFObject:item];
        [tmpArr addObject:carrot];
        [self.privateCarrotsDict setObject:carrot forKey:carrot.carrotID];
    }
    self.privateCarrots = tmpArr;
    return tmpArr;
}

- (JPCarrot *)getDetailPublicCarrotWithCarrotID:(NSString *)carrotID
{
    return [self.publicCarrotsDict objectForKey:carrotID];
}

- (JPCarrot *)getDetailPrivateCarrotWithCarrotID:(NSString *)carrotID
{
    return [self.privateCarrotsDict objectForKey:carrotID];
}

- (void)sendACarrotToServe:(JPCarrot*)carrot
{
    [parseServer sendACarrotToSever:carrot];
}

#pragma mark - Renren Delegate
- (void)renrenDidLogin:(Renren *)renren
{
    NSLog(@"登录成功");
    
    //拉取用户信息
    ROUserInfoRequestParam *requestParam = [[ROUserInfoRequestParam alloc] init];
	requestParam.fields = [NSString stringWithFormat:@"uid,name,tinyurl"];
	[[Renren sharedRenren] getUsersInfo:requestParam andDelegate:self];
    //拉取好友列表
    [self getFriendsList];
}

- (void)renrenDidLogout:(Renren *)renren
{
    NSLog(@"退出成功");
}

- (void)renren:(Renren *)renren requestDidReturnResponse:(ROResponse *)response
{
    NSLog(@"拉取好友成功");
    NSArray *responseArray = (NSArray *)(response.rootObject);
    if ([responseArray count] == 1) {
        self.userInfo = [responseArray objectAtIndex:0];
        NSLog(@"%@", self.userInfo);
    }
    else {
        for ( int i = 0; i < [responseArray count]; i++  )
        {
            NSDictionary *tmpDict = [[responseArray objectAtIndex:i] responseDictionary];
            [self.friendsList addObject:tmpDict];
            [self.idMapping setObject:[tmpDict objectForKey:@"name"] forKey:[tmpDict objectForKey:@"id"]];
        }
        NSLog(@"%@", self.friendsList);
        NSLog(@"%@", self.idMapping);
    }
}

@end
