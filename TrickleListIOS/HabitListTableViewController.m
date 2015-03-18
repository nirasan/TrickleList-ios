//
//  HabitListTableViewController.m
//  TrickleListIOS
//
//  Created by 千葉大二郎 on 2015/03/16.
//  Copyright (c) 2015年 dchiba. All rights reserved.
//

#import "HabitListTableViewController.h"

@interface HabitListTableViewController ()

@property NSMutableArray* habits;
@property NSMutableArray* statuses;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation HabitListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self loadHabits];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateHabits {
    _habits = nil;
    _statuses = nil;
    [self loadHabits];
}

- (void)loadHabits {
    if (_habits == nil) {
        NSArray* array = [Habit MR_findAll];
        _habits = [NSMutableArray arrayWithArray:array];
        _statuses = [NSMutableArray arrayWithCapacity:[_habits count]];
        NSDate* fromDate = [self getToday];
        NSDate* toDate = [fromDate dateByAddingTimeInterval:60*60*24];
        for (Habit* h in _habits) {
            NSPredicate* p = [NSPredicate predicateWithFormat:@"(self IN %@) AND (creationDate >= %@) AND (creationDate < %@)", h.statuses, fromDate, toDate];
            Status* status = [Status MR_findFirstWithPredicate:p];
            [_statuses addObject:(status == nil ? [NSNull null] : status)];
        }
    }
}

- (NSDate*)getToday {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents* components = [calendar components:flags fromDate:[NSDate date]];
    return [calendar dateFromComponents:components];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

#pragma mark - Table view data source

// セクション数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

// セル数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_habits count];
}

// セルの生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self loadHabits];
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Habit* habit = [_habits objectAtIndex:indexPath.row];
    cell.textLabel.text = habit.name;
    Status* status = [_statuses objectAtIndex:indexPath.row];
    if (status != [NSNull null]) {
        cell.backgroundColor = [HabitListTableViewController selectedColor];
    }
    return cell;
}

// セルの詳細ボタン押下
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    StatusListTableViewController* viewController = [[StatusListTableViewController alloc]init];
    viewController.habit = [_habits objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

// セルの選択
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    Status* status = [_statuses objectAtIndex:indexPath.row];
    if (status == [NSNull null]) {
        Status* newStatus = [Status MR_createEntity];
        newStatus.habit = [_habits objectAtIndex:indexPath.row];
        newStatus.creationDate = [NSDate date];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        cell.backgroundColor = [HabitListTableViewController selectedColor];
        [_statuses replaceObjectAtIndex:indexPath.row withObject:newStatus];
    } else {
        [_statuses replaceObjectAtIndex:indexPath.row withObject:[NSNull null]];
        [status MR_deleteEntity];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        cell.backgroundColor = [HabitListTableViewController unselectedColor];
    }
}

// セルの削除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Habit* habit = [_habits objectAtIndex:indexPath.row];
        [habit MR_deleteEntity];
        [_habits removeObjectAtIndex:indexPath.row];
        [_statuses removeObjectAtIndex:indexPath.row];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        NSLog(@"== == == == == == == == == == delete finish == == == == == == == == == == ");
        //[self updateHabits];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - unwindSegue
- (IBAction)unwindCancelSegue:(UIStoryboardSegue *)segue {
    
}
- (IBAction)unwindDoneSegue:(UIStoryboardSegue *)segue {
    [self updateHabits];
    [self.tableView reloadData];
}

#pragma mark - const
+ (UIColor*)selectedColor {
    return [UIColor colorWithRed:0.529 green:0.809 blue:0.922 alpha:1.0];
}
+ (UIColor*)unselectedColor {
    return [UIColor clearColor];
}

@end
