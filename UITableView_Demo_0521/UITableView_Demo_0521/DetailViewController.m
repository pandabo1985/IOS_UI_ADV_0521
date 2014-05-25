//
//  DetailViewController.m
//  UITableView_Demo_0521
//
//  Created by pan dabo on 14-5-25.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
        [view release];
      self.listArray = [UIFont familyNames];
    _listArray = [[UIFont familyNames] retain];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, kDeviceHeight-20-44)style:UITableViewStylePlain];
    _tableView.dataSource = self;//实现数据源方法。
      [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

#pragma mark -TableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
