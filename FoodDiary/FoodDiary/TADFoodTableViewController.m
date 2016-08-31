//
//  TADFoodTableViewController.m
//  FoodDiary
//
//  Listing of food and restaurant names
//
//  Created by Sumeet on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "TADFoodTableViewController.h"
#import "TADAddFoodViewController.h"
#import "TADFoodDetailViewController.h"

@interface TADFoodTableViewController ()

@end

@implementation TADFoodTableViewController
@synthesize foodArray;

//adding food to list
-(void) addFood:(NSDictionary *)newFood
{
    [foodArray addObject:newFood];
    [[self tableView] reloadData];
    NSLog(@"adding food !");
}

//getting path of pList
- (NSString *)plistPath
{
    NSString *homeDirectory = NSHomeDirectory();
    NSString *filePath = [homeDirectory stringByAppendingString:@"/Documents/foods.plist"];
    return filePath;
}

//save data in pList
-(void) saveData:(NSNotification *)notification
{
    NSString *filePath;
    filePath = [self plistPath];
     [foodArray writeToFile:filePath atomically:YES];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //passing data to TADAddFoodViewController
    if ([[segue identifier] isEqualToString:@"AddFoodSegue"])
    {
        TADAddFoodViewController *addFoodViewController=[segue destinationViewController];
        [addFoodViewController setFoodTableViewController:self];
    }
    //passing data to TADFoodDetailViewController
    else if ([[segue identifier] isEqualToString:@"FoodDetailSegue"])
        {
            NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
            NSDictionary *seletedFood = [foodArray objectAtIndex:[selectedRow row]];
            TADFoodDetailViewController *foodDetailViewController = [segue destinationViewController];
            [foodDetailViewController setFood:seletedFood];
        }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:)  name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    //checking file exists or not
    if([[NSFileManager defaultManager] fileExistsAtPath:[self plistPath]])
    {
        foodArray = [[NSMutableArray alloc] initWithContentsOfFile:[self plistPath]];
    }
    else
    {
        //Making dictionary of objects with keys
        NSDictionary *firstFoodDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"Pizza", kTADFoodName,@"Pizza Place",kTADRestaurantName,@"Good",kTADRating, nil];
        
         //converting dicionary into mutable array
        foodArray =[[NSMutableArray alloc]initWithObjects:firstFoodDictionary, nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [foodArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger rowNumber = [indexPath row];
    
    //making dictionary
    NSDictionary *foodDictionary = [foodArray objectAtIndex: rowNumber];
    NSString *food = [foodDictionary objectForKey:kTADFoodName];
    NSString *restaurant = [foodDictionary objectForKey:kTADRestaurantName];
    
    //setting food name
    [[cell textLabel] setText:food];
    
    //setting restaurant name
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
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [foodArray removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
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
