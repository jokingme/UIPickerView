//
//  FourthViewController.m
//  UIDatePicker
//
//  Created by Joker on 15/12/7.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;
@property (nonatomic,strong) NSDictionary *dict;


@property (nonatomic,strong) NSArray *leftArr;
@property (nonatomic,strong) NSArray *rigntArr;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataFromFile];
    
    _PickerView.delegate = self;
    _PickerView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)loadDataFromFile {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"statedictionary" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    _PickerView.delegate = self;
    _PickerView.dataSource = self;
    
    _leftArr = [_dict.allKeys sortedArrayUsingSelector:@selector(compare:)];
    _rigntArr = _dict[_leftArr.firstObject];
}

- (IBAction)select:(id)sender {
}

#pragma mark -UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _leftArr.count;
    }
    return _rigntArr.count;
}

#pragma mark -UIpickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return _leftArr[row];
    }
    return _rigntArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        NSString *key = _leftArr[row];
        _rigntArr = _dict[key];
        
        //刷新右列
        [pickerView reloadComponent:1];
        //更改右列选中的行为
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

//每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 200;
    }
    return 100;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
