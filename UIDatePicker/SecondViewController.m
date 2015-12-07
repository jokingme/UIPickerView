//
//  SecondViewController.m
//  UIDatePicker
//
//  Created by Joker on 15/12/7.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *PickView;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (strong, nonatomic) NSArray *datas;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _PickView.delegate = self;
    _PickView.dataSource = self;
    
    _datas = [[NSArray alloc] initWithObjects:@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
    
    //设置label的文本内容
    _Label.text = _datas.firstObject;
    
    
    // Do any additional setup after loading the view.
}

#pragma mark - UIPickViewDataSource
//设置列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
//每列中的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _datas.count;
}

#pragma mark - UIPickerViewDelegate
//设置文本
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _datas[row];
}

//设置属性文本
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        NSAttributedString *attributeString = [[NSAttributedString alloc]initWithString:_datas[row] attributes:@{NSUnderlineStyleAttributeName:@1,NSForegroundColorAttributeName:[UIColor redColor]}];
        return attributeString;
    }
    return nil;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 60;
}
//选中row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
   // NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:_datas[row] attributes:@{NSUnderlineStyleAttributeName:@1,NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //_Label.text =attributedString;
    _Label.text = _datas[row];
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
