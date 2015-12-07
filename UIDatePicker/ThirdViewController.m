//
//  ThirdViewController.m
//  UIDatePicker
//
//  Created by Joker on 15/12/7.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

//存储每列中选中的行代表的rgb值
@property (nonatomic)CGFloat redColorNum;
@property (nonatomic)CGFloat greenColorNum;
@property (nonatomic)CGFloat blueColorNum;


@end

@implementation ThirdViewController
#define RGBMax 255                            //rgb取值
#define StepValue 5                           //间隔
#define RowNum RGBMax/StepValue + 1       //行数
#define Components 3                          //列数
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger selectRed = round(arc4random()%52);
    [self selectPicker:_pickerView forRow:selectRed inComponent:0];
    
    NSInteger selectGreen = round(arc4random()%52);
    [self selectPicker:_pickerView forRow:selectGreen inComponent:1];
    
    NSInteger selectBlue = round(arc4random()%52);
    [self selectPicker:_pickerView forRow:selectBlue inComponent:2];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)selectPicker:(UIPickerView *)pickerView forRow:(NSInteger)row inComponent:(NSInteger)component {
    [pickerView selectRow:row inComponent:component animated:YES];
    [self pickerView:pickerView didSelectRow:row inComponent:component];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return RowNum;
}
//属性文本
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    CGFloat redNum = 0;
    CGFloat greenNum = 0;
    CGFloat blueNum = 0;
    
    NSInteger currentNum = row *StepValue;
    
    switch (component) {
        case 0:
            redNum = currentNum;
            break;
        case 1:
            greenNum = currentNum;
            break;
        case 2:
            blueNum = currentNum;
            break;
        default:
            break;
    }
    NSAttributedString *attributed = [[NSAttributedString alloc]initWithString:[@(currentNum) stringValue] attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:redNum/255.0 green:greenNum/255.0 blue:blueNum/255.0 alpha:1.0]}];
    return attributed;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    CGFloat value = row *StepValue / 255.0;
    
    switch (component) {
        case 0:
            _redColorNum = value;
            break;
        case 1:
            _greenColorNum = value;
            break;
        case 2:
            _blueColorNum = value;
            break;
            
        default:
            break;
    }
    _colorView.backgroundColor = [UIColor colorWithRed:_redColorNum green:_greenColorNum blue:_blueColorNum alpha:1];
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
