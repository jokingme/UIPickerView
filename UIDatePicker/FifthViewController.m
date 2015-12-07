//
//  FifthViewController.m
//  UIDatePicker
//
//  Created by Joker on 15/12/7.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "FifthViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface FifthViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;
@property (weak, nonatomic) IBOutlet UILabel *Labelwin;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Lever;


@property (nonatomic) NSInteger HardLevel;
@property (nonatomic,strong) NSArray *image;
@property (nonatomic,strong) AVAudioPlayer *player;


@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _PickerView.delegate = self;
    _PickerView.dataSource = self;
    
    _Lever.selectedSegmentIndex = 1;
    _HardLevel = 3;
    
    _image = @[@"apple",@"bar",@"cherry",@"crown",@"lemon",@"seven"];
    
    [self Start:nil];
    
    // Do any additional setup after loading the view.
}

- (IBAction)segmented:(UISegmentedControl *)sender {
    _HardLevel = sender.selectedSegmentIndex + 2;
    
}

//开始游戏
- (IBAction)Start:(UIButton *)sender {
    
    _Labelwin.text = @"";
    //声明连续相同的个数
    int sameRow = 0;
    int compareRow = 0;
    BOOL isWin = NO;
    
    for (int i = 0; i < 5; i++) {
        int  ramNum = round(arc4random()%_image.count);
        if (i == 0) {
            sameRow = 1;
            compareRow = ramNum;
        } else {
            if (compareRow == ramNum) {
                sameRow += 1;
            } else {
                sameRow = 1;
            }
            compareRow = ramNum;
        }
        //更改选中的行
        [_PickerView selectRow:ramNum inComponent:i animated:YES];
        
        if (sameRow >= _HardLevel) {
            isWin = YES;
        }
    }
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"crunch" ofType:@"wav"];
    [self play:path];
    
    if (isWin) {
        _Labelwin.text = @"Win!!";
        
        NSString *winPath = [[NSBundle mainBundle]pathForResource:@"win" ofType:@"wav"];
        [self play:winPath];
    }
    
    
}

- (void)play:(NSString *)soundPath {
#if 0
    //!!!使用initWithContentsOfURL方法来初始化_player的时候要保证音频路径中不包含中文字符，否则创建url失败，创建_player失败
    NSURL *url = [NSURL URLWithString:soundPath];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
#else
    _player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:soundPath] error:nil];
#endif
    _player.delegate = self;
    [_player prepareToPlay];
    [_player play];
    
    
    //    SystemSoundID soundId;
    //    //把声音文件转化成nsurl 把nsurl强转成 CFURLRef
    //    CFURLRef ref = (__bridge CFURLRef)[NSURL fileURLWithPath:soundPath];
    //    //用ref创建soundID
    //    AudioServicesCreateSystemSoundID(ref, &soundId);
    //    //根据soundId进行播放声音
    //    AudioServicesPlaySystemSound(soundId);
    
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _image.count;
}

#pragma mark -UIPickerViewDelegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_image[row]]];
    return imgView;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 80;
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
