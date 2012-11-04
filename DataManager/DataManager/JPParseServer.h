//
//  JPParseServer.h
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface JPParseServer : NSObject

@property (nonatomic)int testI;

- (void)sendACarrotToSever:(JPCarrot*)carrot;
- (JPCarrot*)getAPublicDetialCarrot:(NSString*)carrotID;
- (JPCarrot*)getAPrivateDetialCarrot:(NSString*)carrotID;
- (NSArray*)getGeneralPublicCarrotsWithNum:(int)number;
- (NSArray*)getGeneralPrivateCarrots:(NSString*)uid;

@end
