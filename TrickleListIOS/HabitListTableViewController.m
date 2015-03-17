//
//  HabitListTableViewController.m
//  TrickleListIOS
//
//  Created by 千葉大二郎 on 2015/03/16.
//  Copyright (c) 2015年 dchiba. All rights reserved.
//

#import "HabitListTableViewController.h"

@interface HabitListTableViewController ()

@property NSArray* habits;

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
    [self loadHabits];
}

- (void)loadHabits {
    if (_habits == nil) {
        _habits = [Habit MR_findAll];
        
        [Habit MR_findAll]
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    NSLog(@"== CALL setEditing ==");
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_habits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self loadHabits];
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Habit* habit = [_habits objectAtIndex:indexPath.row];
    cell.textLabel.text = habit.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    StatusListTableViewController* viewController = [[StatusListTableViewController alloc]init];
    viewController.habit = [_habits objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    UIColor* color = cell.backgroundColor;
    UIColor* selectedColor = [UIColor colorWithRed:0.529 green:0.809 blue:0.922 alpha:1.0];
    NSLog(@"== background color is %@", color);
    if (color == [UIColor clearColor]) {
        cell.backgroundColor = selectedColor;
    } else {
        cell.backgroundColor = [UIColor clearColor];
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

@end
