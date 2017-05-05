//
//  listAreaTableViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 04/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "listAreaTableViewController.h"
#import "listViewCell.h"
#import "detailViewController.h"

@interface listAreaTableViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation listAreaTableViewController{
    NSArray *json;
    NSDictionary *info;
    NSArray *sortedJsonArray;
    NSMutableArray *filteredArray;
    BOOL isFiltered;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar sizeToFit];
    [self serverSide];
    self.searchBar.delegate = self;
}


-(void)serverSide{
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/getParkingAreaDetail.php"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    //sorting array by distance
    /*NSSortDescriptor *sortingByDistance = [[NSSortDescriptor alloc] initWithKey:@"" ascending:YES];
    NSArray *sortDescriptors = @[sortingByDistance];
    sortedJsonArray = [json sortedArrayUsingDescriptors:sortDescriptors];*/
    //...........................
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0) {
        isFiltered = NO;
    }
    else{
        isFiltered = YES;
    }
    filteredArray = [[NSMutableArray alloc]init];
    for (NSDictionary *item in json) {
        NSString *str = [item objectForKey:@"name"];
        NSRange strRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if (strRange.location != NSNotFound) {
            [filteredArray addObject:item];
        }
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isFiltered) {
        return [filteredArray count];
    }
    
    return [json count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    listViewCell *cell = (listViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    //info = [json objectAtIndex:indexPath.row];
    
    NSString *url =@"http://localhost/parkme/images/";
    NSString *im = [[json objectAtIndex:indexPath.row] objectForKey:@"image"];
    url = [url stringByAppendingString:im];
     UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: url]]];
    cell.cellImageView.image = image;
    
    if (isFiltered) {
        cell.cellLabel1.text = [[filteredArray objectAtIndex:indexPath.row] objectForKey:@"name"];
        cell.cellLabel2.text = @"(0.6 miles away)";
        NSString *str = [[filteredArray objectAtIndex:indexPath.row] objectForKey:@"parking_fee"];
        cell.cellLabel3.text = [NSString stringWithFormat:@"$%@",str];
    }
    else
    {
        cell.cellLabel1.text = [[json objectAtIndex:indexPath.row] objectForKey:@"name"];
        cell.cellLabel2.text = @"(0.6 miles away)";
        NSString *str = [[json objectAtIndex:indexPath.row] objectForKey:@"parking_fee"];
        cell.cellLabel3.text = [NSString stringWithFormat:@"$%@",str];
    }
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"detailVCSegue"]) {
        detailViewController *destinationVC = [segue destinationViewController];
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        NSArray *parkingDetail;
        if (isFiltered) {
            parkingDetail= [filteredArray objectAtIndex:indexPath.row];
        } else {
            parkingDetail= [json objectAtIndex:indexPath.row];
        }
        destinationVC.parkingAreaDetail = parkingDetail;
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
=        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
*/



@end
