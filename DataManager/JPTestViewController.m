//
//  JPTestViewController.m
//  DataManager
//
//  Created by Jacob Pan on 12-11-2.
//  Copyright (c) 2012年 Jacob Pan. All rights reserved.
//

#import "JPTestViewController.h"
#import "DataManager/JPDataManager.h"

@interface JPTestViewController ()

@end

@implementation JPTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    JPCarrot *carrot = [[JPCarrot alloc] init];
//    carrot.longitude = 111.0;
//    carrot.latitude = 222.0;
//    carrot.message = @"HelloWorld";
//    carrot.isPublic = NO;
//    carrot.senderID = @"245318989";
//    carrot.receiverID = [NSArray arrayWithObjects:@"417923427", @"123456789", nil];
//    carrot.sendedTime = @"2012-11-02 10:57";
    
//    JPParseServer *parse = [[JPParseServer alloc] init];
//    carrot = [parse getAPrivateDetialCarrot:@"d0RekMdfBh"];
//    NSLog(@"%@", carrot.receiverID);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"登录拉好友" forState:UIControlStateNormal]; 
    [btn setFrame:CGRectMake(20, 20, 120, 40)];
    [btn addTarget:self action:@selector(btn1Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"只拉好友" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(180, 20, 120, 40)];
    [btn addTarget:self action:@selector(btn2Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"拉公共萝卜概要" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20, 80, 120, 40)];
    [btn addTarget:self action:@selector(btn3Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"拉私有萝卜概要" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(180, 80, 120, 40)];
    [btn addTarget:self action:@selector(btn4Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"拉详细公共萝卜" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20, 140, 120, 40)];
    [btn addTarget:self action:@selector(btn5Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"拉详细私用萝卜" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(180, 140, 120, 40)];
    [btn addTarget:self action:@selector(btn6Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"发10公共萝卜" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20, 200, 120, 40)];
    [btn addTarget:self action:@selector(btn7Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"发100公共萝卜" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(180, 200, 120, 40)];
    [btn addTarget:self action:@selector(btn8Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"发10私有萝卜" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20, 260, 120, 40)];
    [btn addTarget:self action:@selector(btn9Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"发100私用萝卜" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(180, 260, 120, 40)];
    [btn addTarget:self action:@selector(btn10Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //////test
//    NSNotificationCenter *ntfCenter = [NSNotificationCenter defaultCenter];
//    [ntfCenter addObserver:[JPDataManager sharedInstance] selector:@selector(sendSuccessedCallback) name:@"sendSuccessed" object:self];
    
//    UILocalNotification *notification=[[UILocalNotification alloc] init];
//    if (notification!=nil) {
//        NSLog(@">> support local notification");
//        NSDate *now=[NSDate new];
//        notification.fireDate=[now addTimeInterval:10];
//        notification.timeZone=[NSTimeZone defaultTimeZone];
//        notification.alertBody=@"该去吃晚饭了！";
//        [[UIApplication sharedApplication]   scheduleLocalNotification:notification];
//    }
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 280, 40)];
    [self.label setText:@"测试开始"];
    [self.view addSubview:self.label];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Btn Event

- (void) btn1Pressed
{
    NSLog(@"Button 1 Pressed");
    [[JPDataManager sharedInstance] RenrenLogin];
    [self.label setText:@"登录拉取好友成功"];
}

- (void) btn2Pressed
{
    NSLog(@"Button 2 Pressed");
    [[JPDataManager sharedInstance] getFriendsList];
    [self.label setText:@"拉好友成功"];
}

- (void) btn3Pressed
{
    NSLog(@"Button 3 Pressed");
    
    NSArray *arr = [[JPDataManager sharedInstance] getGeneralPublicCarrotsWithNumber:10];
    NSLog(@"%d", [arr count]);
    [self.label setText:@"Success3!"];
}

- (void) btn4Pressed
{
    NSLog(@"Button 4 Pressed");
    
    NSArray *arr = [[JPDataManager sharedInstance] getGeneralPrivateCarrotsWithUid:@"245318989"];
    NSLog(@"%d", [arr count]);
    [self.label setText:@"Success4!"];
}

- (void) btn5Pressed
{
    NSLog(@"Button 5 Pressed");
    JPCarrot *carrot = [[JPDataManager sharedInstance] getDetailPublicCarrotWithCarrotID:@"245318989 2012-11-9 2:10"];
    NSLog(@"%@", carrot);
    [self.label setText:@"Success5!"];
}

- (void) btn6Pressed
{
    NSLog(@"Button 6 Pressed");
    JPCarrot *carrot = [[JPDataManager sharedInstance] getDetailPrivateCarrotWithCarrotID:@"245318989 2012-11-5 2:10"];
    NSLog(@"%@", carrot);
    [self.label setText:@"Success6!"];
}

- (void) btn7Pressed
{
    NSLog(@"Button 7 Pressed");
    
    NSString *message;
    NSString *sendedTime;
    for ( int i = 0; i < 10; i++ ) {
        message = [NSString stringWithFormat:@"山兔测试测试 %d", i];
        sendedTime = [NSString stringWithFormat:@"2012-11-%d 2:10", i];
        JPCarrot *carrot = [[JPCarrot alloc] initPublicCarrotWithLogitude:@"1111.1" withLatitude:@"22222.2" withMessage:message withSenderID:@"245318989" withSendedTime:sendedTime];
        [[JPDataManager sharedInstance] sendACarrotToServe:carrot];
    }
    [self.label setText:@"Success7!"];
}

- (void) btn8Pressed
{
    NSLog(@"Button 8 Pressed");
    
    NSString *message;
    NSString *sendedTime;
    for ( int i = 0; i < 60; i++ ) {
        message = [NSString stringWithFormat:@"山兔测试测试 %d", i];
        sendedTime = [NSString stringWithFormat:@"2012-11-%d 2:10", i];
        JPCarrot *carrot = [[JPCarrot alloc] initPublicCarrotWithLogitude:@"33333.3" withLatitude:@"44444.4" withMessage:message withSenderID:@"245318989" withSendedTime:sendedTime];
        [[JPDataManager sharedInstance] sendACarrotToServe:carrot];
    }
    [self.label setText:@"Success8!"];
}

- (void) btn9Pressed
{
    NSLog(@"Button 9 Pressed");
    
    NSString *message;
    NSString *sendedTime;
    for ( int i = 0; i < 10; i++ ) {
        message = [NSString stringWithFormat:@"山兔测试测试 %d", i];
        sendedTime = [NSString stringWithFormat:@"2012-11-%d 2:10", i];
        JPCarrot *carrot = [[JPCarrot alloc] initPrivateCarrotWithLogitude:@"44444.4" withLatitude:@"44444.4" withMessage:message withSenderID:@"245318989" withReceiverID:[NSArray arrayWithObjects:@"245318989", @"417923427", @"123456789", nil] withSendedTime:sendedTime];
        [[JPDataManager sharedInstance] sendACarrotToServe:carrot];
    }
    [self.label setText:@"Success9!"];
}

- (void) btn10Pressed
{
    NSLog(@"Button 10 Pressed");
    
    NSString *message;
    NSString *sendedTime;
    for ( int i = 0; i < 70; i++ ) {
        message = [NSString stringWithFormat:@"山兔测试测试 %d", i];
        sendedTime = [NSString stringWithFormat:@"2012-11-%d 2:10", i];
        JPCarrot *carrot = [[JPCarrot alloc] initPrivateCarrotWithLogitude:@"22222.4" withLatitude:@"22222.4" withMessage:message withSenderID:@"245318989" withReceiverID:[NSArray arrayWithObjects:@"245318989", @"417923427", @"123456789", nil] withSendedTime:sendedTime];
        [[JPDataManager sharedInstance] sendACarrotToServe:carrot];
    }
    [self.label setText:@"Success10!"];
}

//- (void) sendSuccessedCallback
//{
//    NSLog(@"sendddddddd");
//}

@end
