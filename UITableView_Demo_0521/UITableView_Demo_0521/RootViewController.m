//
//  RootViewController.m
//  UITableView_Demo_0521
//
//  Created by pan dabo on 14-5-21.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"UITableView Style";
    }
    return self;
}


-(void)loadView
{
    [super loadView];
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    [view release];
  
//    self.listArray = [UIFont familyNames];
//    _listArray = [[UIFont familyNames] retain];
    _listArray = [@[@"UITabViewStylePlain",@"UITalbeViewStyleGrouped"]retain];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, kDeviceHeight-20-44)style:UITableViewStyleGrouped];
    _tableView.dataSource = self;//实现数据源方法。
    _tableView.delegate = self;
    _tableView.rowHeight = 70;
//    UIImageView *backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
//    _tableView.backgroundView = backGroundView;
//    [backGroundView release];
//    _tableView.separatorColor = [UIColor purpleColor];
//    _tableView.separatorStyle = UITableViewCellStyleValue1;
//    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//    headView.backgroundColor = [UIColor redColor];
//    _tableView.tableHeaderView = headView;
//    [headView release];
    
//    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//    footView.backgroundColor = [UIColor redColor];
//    _tableView.tableFooterView = footView;
//    [footView release];
    [self.view addSubview:_tableView];

    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -TableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPaht = %@",indexPath);
    static NSString *cellInentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInentifier];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInentifier] autorelease];
//        cell.backgroundColor = [UIColor redColor];
    }
    NSString *fontName =[self.listArray objectAtIndex:indexPath.row];
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:14.0f];
    return cell;
}

-(void)dealloc
{
        [_tableView release];
    _tableView = nil;

    [super dealloc];
  
}

#pragma mark -UITableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpaht = %@",indexPath);
    DetailViewController *detailCtrl = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailCtrl animated:YES];
    [detailCtrl release];
    
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
