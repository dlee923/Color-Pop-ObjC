//
//  ViewController.h
//  UIPanGestureRecognizer - Color Pop ObjC
//
//  Created by Daniel Lee on 7/31/17.
//  Copyright © 2017 DLEE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *viewsDictionary;
@property (nonatomic) int numberOfColumnsToCreate;
@property (strong, nonatomic) UIView *selectedCell;
@property (nonatomic) int sizeOfBlock;

-(void)setUpBlocksOfDifferentColor:(int)numberOfColumns;
-(UIColor *)assignRandomColor;
-(void)handleGestureRecognizer:(UIPanGestureRecognizer*)sender;

@end

