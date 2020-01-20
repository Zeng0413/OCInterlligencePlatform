//
//  WKBoundlessScrollViewCell.m
//  Calendar
//
//  Created by macairwkcao on 15/12/16.
//  Copyright © 2015年 CWK. All rights reserved.
//

#import "WKBoundlessScrollViewCell.h"
#import "CellDateModel.h"
#import "DateView.h"
#import "DateModel.h"
@interface WKBoundlessScrollViewCell ()
{
    NSInteger _year;
    NSInteger _month;
    NSInteger _day;
    NSInteger _weekday;
}
@end


@implementation WKBoundlessScrollViewCell
-(instancetype)initWithIdentifier:(NSString *)identifier
{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0);
    self = [super initWithFrame:frame];
    if (self) {
//        [self getCurrentDate];
        self.identifier = identifier;
//        self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width-40, 40)];

    }
    return self;
}

-(void)fillDate:(CellDateModel *)cellDateModel
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    
    CGFloat width = (self.frame.size.width)/7.0;
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,  (width+15)*cellDateModel.drawDayRow+10+30);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kViewW-20-130, 5, 130, 30)];
    label.font = kFont(14);
    label.text = [NSString stringWithFormat:@"%ld年%ld月",cellDateModel.year,cellDateModel.month];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = TEXT_COLOR_BLACK;
    [self addSubview:label];
    for (int i = 0; i < cellDateModel.monthDays; i++) {
        if (i == 0) {
            
        }
        DateModel *dateModel = cellDateModel.dateModelArray[i];
        NSInteger column =  dateModel.weekday;
        NSInteger row = (i+cellDateModel.drawDayBeginIndex)/7;
        DateView *dateView = [[DateView alloc] initWithFrame:CGRectMake(column*width, row*(width/2+15)+5+30+5, width, width/2)];
        [dateView fillDate:dateModel];
        [self addSubview:dateView];
        
        if (cellDateModel.monthDays - 1 == i) {
            self.height = MaxY(dateView)+15;
        }
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
}


-(void)setDeviation:(NSInteger)deviation
{
    _deviation = deviation;
//    [self fillDate:[self getDateModel:deviation]];
//    self.label.text = [NSString stringWithFormat:@"%ld",(long)_deviation];
}








@end
