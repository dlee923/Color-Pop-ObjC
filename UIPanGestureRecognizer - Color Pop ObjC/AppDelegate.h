//
//  AppDelegate.h
//  UIPanGestureRecognizer - Color Pop ObjC
//
//  Created by Daniel Lee on 7/31/17.
//  Copyright © 2017 DLEE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

