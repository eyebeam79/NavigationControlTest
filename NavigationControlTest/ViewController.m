//
//  ViewController.m
//  NavigationControlTest
//
//  Created by SDT1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"
#import "DetailVC.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
{
    NSArray *data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

// 프로토타입 방식으로 테이블 구성. 스토리보드에서 셀의 ID를 지정해서 사용한다.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID" forIndexPath:indexPath];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

// URL을 디테일 뷰 컨트롤러로 전달
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailVC *detail = segue.destinationViewController;
    
    // Sender는 테이블의 셀
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    // 셀을 이용해서 indexPath를 얻어온다.
    NSIndexPath *selectedIndex = [self.table indexPathForCell:selectedCell];
    detail.urlStr = [data objectAtIndex:selectedIndex.row];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // 데이터 초기화
    data = @[@"apple.com", @"google.com", @"daum.net", @"naver.com"];
}

- (void)viewWillAppear:(BOOL)animated
{
    // 네비게이션바를 숨긴다.
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
