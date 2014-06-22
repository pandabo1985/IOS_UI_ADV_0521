//
//  RootViewController.m
//  UIPickerViewDemo_0622
//
//  Created by pan dabo on 14-6-22.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 460-216, 0, 0)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:pickerView];
    [pickerView release];
    
    //填充数据
    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *path = [[bundle resourcePath] stringByAppendingPathComponent:@"city.plist"];
    NSString *paht = [bundle pathForResource:@"city" ofType:@"plist"];
    data = [[NSArray alloc] initWithContentsOfFile:paht];
}

#pragma mark -UIPickerView delegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 100;
    }else{
        return 220;
    }
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return data.count;
    }
    
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSDictionary *cityItems = [data objectAtIndex:selectedRow];
    NSArray *cities = [cityItems objectForKey:@"cities"];
    return cities.count;;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component ==0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        view.backgroundColor = [UIColor grayColor];
        return [view autorelease];
    }
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 220, 40)];
    view2.backgroundColor = [UIColor blueColor];
    return [view2 autorelease]; 
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component ==0) {
      NSDictionary *dic = [data objectAtIndex:row];
        NSString *state = [dic objectForKey:@"state"];
        return state;
    }
    
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSDictionary *items = [data objectAtIndex:selectedRow];
    NSArray *cities = [items  objectForKey:@"cities"];
    NSString *cityName = [cities objectAtIndex:row];
    return cityName;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component ==0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
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
