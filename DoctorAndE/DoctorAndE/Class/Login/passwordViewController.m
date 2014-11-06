//
//  passwordViewController.m
//  DoctorAndE
//
//  Created by Krt on 14/11/5.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import "passwordViewController.h"
#import "finshiRegisterViewController.h"
@interface passwordViewController ()

@end

@implementation passwordViewController

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

- (IBAction)next:(id)sender {
    finshiRegisterViewController *nextF =[[finshiRegisterViewController alloc]init];
    [self presentViewController:nextF animated:YES completion:nil];
}
@end
