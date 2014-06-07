//
//  DetailViewController.m
//  CustomeCellDemo
//
//  Created by pan dabo on 14-6-7.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "DetailViewController.h"
#import "MyCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad]; 
    _listArray = [UIFont familyNames];
    self.tableView.rowHeight = 60;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    if (self.type == kContentCellTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
            label.tag = 101;
            label.backgroundColor  = [UIColor redColor];
            [cell.contentView addSubview:label];
        }
        UILabel *labe = (UILabel *)[cell.contentView viewWithTag:101];
        labe.text = _listArray[indexPath.row];
        return cell;
    }else if(self.type == kNibCellTableView){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"mycell" owner:self options:nil];
            cell =[nibs objectAtIndex:0];
        }
        UILabel *labe = (UILabel *)[cell.contentView viewWithTag:201];
        labe.text = _listArray[indexPath.row];
        UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:202];
        imageView.backgroundColor = indexPath.row%2==0?[UIColor redColor]:[UIColor yellowColor];
        return cell;
    }else if(self.type == kCustomCellTableView){
        MyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }

//        cell.textLabel.text = _listArray[indexPath.row];
//        cell.textLabel.frame = CGRectMake( 160, 0,160, 80);
//        NSLog(@"textlable <<<<<<< %@",NSStringFromCGRect(cell.textLabel.frame));
        cell.data = _listArray[indexPath.row];
        return cell;
    }else{
        return nil;
    }

    return nil;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
