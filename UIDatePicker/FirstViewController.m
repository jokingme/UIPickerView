//
//  ViewController.m
//  UIDatePicker
//
//  Created by Joker on 15/12/7.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置范围
    //设置最小时间
    //创建时间的组成部分
    
    NSDateComponents *components = [[NSDateComponents alloc]init];
    //设置日期
    components.year = 2015;
    components.day = 21;
    components.month = 11;
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *mindate = [calendar dateFromComponents:components];
    
    _DatePicker.minimumDate = mindate;
    
    //设置最大事件
    NSDate *maxDate = [[NSDate alloc]initWithTimeIntervalSinceNow:24 * 60 * 60];
    _DatePicker.maximumDate = maxDate;
    
    //把世界时间转化成当前时区的时间
//    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
//    
//    NSInteger intral = [timeZone secondsFromGMTForDate:_DatePicker.date];
//    NSDate *localDate = [_DatePicker.date dateByAddingTimeInterval:intral];
//    
//    NSString *dateString = [_DatePicker.date descriptionWithLocale:_DatePicker.locale];
    
    //添加事件
    [_DatePicker addTarget:self action:@selector(dataPickerChange:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)dataPickerChange:(UIDatePicker *)datePidcker {
    NSLog(@"%@",[datePidcker.date descriptionWithLocale:datePidcker.locale]);
}

- (IBAction)Selected:(UIButton *)sender {
    //当前 时间
    NSString *selected = [_DatePicker.date descriptionWithLocale:_DatePicker.locale];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"TIME" message:selected preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:act];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
