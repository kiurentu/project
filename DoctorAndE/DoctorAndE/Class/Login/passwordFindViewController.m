//
//  passwordFindViewController.m
//  DoctorAndE
//
//  Created by Krt on 14/11/6.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import "passwordFindViewController.h"

@interface passwordFindViewController ()

@end

@implementation passwordFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)dissmissKey:(id)sender {
    [self.view endEditing:YES];
}
@end
