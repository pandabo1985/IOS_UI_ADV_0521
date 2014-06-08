//
//  RootViewController.m
//  EditTableViewDemo_0608
//
//  Created by pan dabo on 14-6-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    _fontsArray = [[NSMutableArray arrayWithArray:[UIFont familyNames]] retain];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
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

    return [_fontsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 320, 44)];
//        label.backgroundColor = [UIColor yellowColor];
        label.tag = 101;
        [cell.contentView addSubview:label];
    }
    UILabel *label = (UILabel *)[cell viewWithTag:101];
    label.text = _fontsArray[indexPath.row];
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
    }else{
         [self.tableView setEditing:YES animated:YES];
    }
}




// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        return NO;
    }
    return YES;
}

#pragma mark -TableView delegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        return UITableViewCellEditingStyleNone;
    }else if(indexPath.row == 1){
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath = %d",indexPath.row);
}

static int count = 1;
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_fontsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *newFont = [NSString stringWithFormat:@"new font %d",count];
        [_fontsArray insertObject:newFont atIndex:indexPath.row+1];
        NSIndexPath *_indexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[_indexPath]withRowAnimation:UITableViewRowAnimationMiddle];
        count++;
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *text = [[_fontsArray objectAtIndex:fromIndexPath.row] copy];
    [_fontsArray removeObject:text];
    [_fontsArray insertObject:text atIndex:toIndexPath.row];
    [text release];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.row==0) {
        return NO;
    }
    return YES;
}


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
