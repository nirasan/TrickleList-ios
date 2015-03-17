//
//  HabitListTableViewController.h
//  TrickleListIOS
//
//  Created by 千葉大二郎 on 2015/03/16.
//  Copyright (c) 2015年 dchiba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MagicalRecord.h>
#import <CoreData+MagicalRecord.h>
#import "HabitAddViewController.h"
#import "StatusListTableViewController.h"
#import "Habit.h"
#import "Status.h"

@interface HabitListTableViewController : UITableViewController

- (IBAction)unwindCancelSegue:(UIStoryboardSegue*)segue;
- (IBAction)unwindDoneSegue:(UIStoryboardSegue*)segue;

@end
