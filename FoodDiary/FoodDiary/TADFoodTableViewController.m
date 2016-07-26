//
//  TADFoodTableViewController.m
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "TADFoodTableViewController.h"
#import "TADAddFoodViewController.h"
#import "TADFoodDetailViewController.h"

@interface TADFoodTableViewController ()

@end

@implementation TADFoodTableViewController
@synthesize foodArray;

-(void) addFood:(NSDictionary *)newFood{
    
    [foodArray addObject:newFood];
    [[self tableView] reloadData];
    NSLog(@"adding food !");
}

- (NSString *)plistPath {
    NSString *homeDirectory = NSHomeDirectory();
    NSString *filePath = [homeDirectory stringByAppendingString:@"/documents/foods.plist"];
    return filePath;
}

-(void) saveData:(NSNotification *)notification{
    
    NSLog(@"aaaaa");
    NSString *filePath;
    filePath = [self plistPath];
    [foodArray writeToFile:filePath atomically:YES];
    NSLog(@"sssss");
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"AddFoodSegue"]) {
        TADAddFoodViewController *addFoodViewController=[segue destinationViewController];
        [addFoodViewController setFoodTableViewController:self];
    } else if ([[segue identifier] isEqualToString:@"FoodDetailSegue"]){
        
        NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
        NSDictionary *seletedFood = [foodArray objectAtIndex:[selectedRow row]];
        
        TADFoodDetailViewController *foodDetailViewController = [segue destinationViewController];
        [foodDetailViewController setFood:seletedFood];
        
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:)  name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:[self plistPath]]){
        foodArray = [[NSMutableArray alloc] initWithContentsOfFile:[self plistPath]];
    }else {
    NSDictionary *firstFoodDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"Pizza", kTADFoodName,@"Pizza Place",kTADRestaurantName, nil];
    
    foodArray =[[NSMutableArray alloc]initWithObjects:firstFoodDictionary, nil];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [foodArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"BasicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger rowNumber = [indexPath row];
    
    NSDictionary *foodDictionary = [foodArray objectAtIndex: rowNumber];
    NSString *food = [foodDictionary objectForKey:kTADFoodName];
    NSString *restaurant = [foodDictionary objectForKey:kTADRestaurantName];
    
    [[cell textLabel] setText:food];
   [[cell detailTextLabel] setText:restaurant];
    
    NSLog(@"tableview is asking for cell %ld",(long)[indexPath row]);
    return cell;
}

/*

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [foodArray removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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

@end
