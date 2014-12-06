//
//  AppDelegate.h
//  GrandmaContact
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ImageManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ViewController * vc;
@property (nonatomic, strong) ImageManager * imageManager;
@end

