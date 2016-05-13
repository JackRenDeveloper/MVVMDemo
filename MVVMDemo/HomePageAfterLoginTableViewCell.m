//
//  HomePageAfterLoginTableViewCell.m
//  ZHBWorker
//
//  Created by JackRen on 16/2/1.
//  Copyright © 2016年 atense. All rights reserved.
//

#import "HomePageAfterLoginTableViewCell.h"
#import "UIView+Common.h"
#import "IStarsView.h"


#define LEFTMARGIN 6
#define TOPMARGIN 14


@implementation HomePageAfterLoginTableViewCell {
//    UIView *_backView;
    UIImageView *_confirmImageView;
    UIImageView *_headerImageView;
    UILabel *_titleLabel;
    UIImageView *_flagImageView;
    UILabel *_everyDayMoneyLabel;
    IStarsView *_starImageView;
    UILabel *_typeLabe;
    UIImageView *_startTimeImageView;
    UILabel *_startTimeLabel;
    UIImageView *_addressImageView;
    UILabel *_addresslabel;
    UILabel *_roadLabel;
    UIButton *_concernImageView;
    UILabel *_distanceLabel;
    UIView *_leftView;
    UIView *_rightView;
    UILabel *_headLabel;
    BOOL _isLike;
    NSDictionary *_dic;
    UIView *_flagLabel;
    UIView *_pictureView;
    NSMutableArray *_pictureArray;
    NSInteger picCount;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        picCount = 0;
        [self customCell];
        [self setupSignal];
    }
    return  self;
}


- (void)customCell {
    _backView = [UIView new];
    _backView.layer.cornerRadius = 4.0;
    _backView.clipsToBounds = YES;
    _backView.layer.borderWidth = 1.0*KScDefineWidth;
    _backView.layer.borderColor = [LINECOLOR CGColor];
//    _backView.layer.masksToBounds = YES;
    
    _backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_backView];
    
    _pictureView = [UIView new];
    _pictureView.backgroundColor = [UIColor whiteColor];
    [_backView addSubview:_pictureView];
    
    _confirmImageView = [UIImageView new];
    [_backView addSubview:_confirmImageView];
    _flagLabel = [UIView new];
    _flagLabel.layer.cornerRadius = 2.5;
    [_confirmImageView addSubview:_flagLabel];
    _headerImageView = [UIImageView new];
    [_backView addSubview:_headerImageView];
    _headLabel = [UILabel new];
    _headLabel.font = [UIFont systemFontOfSize:12*KScDefineWidth];
    _headLabel.textAlignment = NSTextAlignmentCenter;
    [_headerImageView addSubview:_headLabel];
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:15*KScDefineWidth];
    _titleLabel.textColor = LHColor(69, 69, 69);
    [_backView addSubview:_titleLabel];
    _distanceLabel = [UILabel new];
    _distanceLabel.textColor = LHColor(165, 165, 165);
    _distanceLabel.textAlignment = NSTextAlignmentRight;
    _distanceLabel.font = [UIFont systemFontOfSize:12*KScDefineWidth];
    [_backView addSubview:_distanceLabel];
    _everyDayMoneyLabel = [UILabel new];
    _everyDayMoneyLabel.font = [UIFont systemFontOfSize:12*KScDefineWidth];
    _everyDayMoneyLabel.textColor = LHColor(130,130, 130);
    _everyDayMoneyLabel.textAlignment = NSTextAlignmentRight;
    [_backView addSubview:_everyDayMoneyLabel];
    _flagImageView = [UIImageView new];
    [_backView addSubview:_flagImageView];
    _typeLabe = [UILabel new];
    _typeLabe.font = [UIFont systemFontOfSize:10*KScDefineWidth];
    _typeLabe.textAlignment = NSTextAlignmentRight;
    _typeLabe.textColor = LHColor(64, 194, 104);
    [_backView addSubview:_typeLabe];
    _starImageView = [IStarsView new];
    _starImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_backView addSubview:_starImageView];
    _startTimeImageView = [UIImageView new];
    [_backView addSubview:_startTimeImageView];
    _startTimeLabel = [UILabel new];
    _startTimeLabel.font = [UIFont systemFontOfSize:12*KScDefineWidth];
    _startTimeLabel.textColor = LHColor(165, 165, 165);
    [_backView addSubview:_startTimeLabel];
    _addressImageView = [UIImageView new];
    [_backView addSubview:_addressImageView];
    _addresslabel = [UILabel new];
    _addresslabel.textColor = LHColor(165, 165, 165);
    _addresslabel.font = [UIFont systemFontOfSize:12*KScDefineWidth];
    [_backView addSubview:_addresslabel];
    _roadLabel = [UILabel new];
    _roadLabel.layer.cornerRadius = 4.0;
    _roadLabel.backgroundColor = LHColor(25, 158, 253);
    [_backView addSubview:_roadLabel];
    _concernImageView = [UIButton buttonWithType:UIButtonTypeCustom];
    //    UITapGestureRecognizer *concernTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(concernAction:)];
//    [_concernImageView addGestureRecognizer:concernTap];
//    [_concernImageView addTarget:self action:@selector(concernAction:) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:_concernImageView];
    _leftView = [UIView new];
    _leftView.backgroundColor = BACKGROUND;
    [self.contentView addSubview:_leftView];
    _rightView = [UIView new];
    _rightView.backgroundColor = BACKGROUND;
    [self.contentView addSubview:_rightView];
}




- (void)layoutSubviews {
    [super layoutSubviews];
    _backView.frame = CGRectMake(5*KScDefineWidth, -1*KScDefineWidth, width(self.frame) - 10*KScDefineWidth, height(self.frame) + 2*KScDefineWidth);
    _leftView.frame = CGRectMake(0, 0, 5*KScDefineWidth, height(self.frame) + 1*KScDefineWidth);
    _confirmImageView.frame = CGRectMake(1*KScDefineWidth, 1*KScDefineWidth, 60*KScDefineWidth/2, 60*KScDefineWidth/2);
    _flagLabel.frame = CGRectMake(2*KScDefineWidth, 2*KScDefineWidth, 5*KScDefineWidth, 5*KScDefineWidth);
    _headerImageView.frame = CGRectMake(LEFTMARGIN*KScDefineWidth + 5*KScDefineWidth, TOPMARGIN*KScDefineWidth, 101*KScDefineWidth/2, 101*KScDefineWidth/2);
    _headLabel.frame = CGRectMake(0, (height(_headerImageView.frame) - 11.5*KScDefineWidth)/2, width(_headerImageView.frame), 11.5);
    CGFloat titlWidth =[_titleLabel.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 80*KScDefineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15*KScDefineWidth]} context:nil].size.width;
     CGFloat everydayWidth =[_everyDayMoneyLabel.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 80*KScDefineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12*KScDefineWidth]} context:nil].size.width + 10*KScDefineWidth;
    
    if ((titlWidth + 24*KScDefineWidth/2 + everydayWidth) >= (width(self.frame) - 2*LEFTMARGIN*KScDefineWidth - 120*KScDefineWidth/2 - 20*KScDefineWidth/2 - 101*KScDefineWidth/2 - 14*KScDefineWidth/2)) {
        _titleLabel.frame = CGRectMake(maxX(_headerImageView) + 14*KScDefineWidth/2, minY(_headerImageView), width(self.frame) - everydayWidth - 101*KScDefineWidth/2 - 2*LEFTMARGIN*KScDefineWidth - 20*KScDefineWidth/2 - 24*KScDefineWidth/2 - 14*KScDefineWidth/2, 29*KScDefineWidth/2);
        _flagImageView.frame = CGRectMake(width(self.frame) - everydayWidth - LEFTMARGIN*KScDefineWidth - 24*KScDefineWidth/2 - 10*KScDefineWidth/2, minY(_titleLabel), 24*KScDefineWidth/2, 29*KScDefineWidth/2);
    }else {
        _titleLabel.frame = CGRectMake(maxX(_headerImageView) + 14*KScDefineWidth/2, minY(_headerImageView), titlWidth, 29*KScDefineWidth/2);
        _flagImageView.frame = CGRectMake(maxX(_titleLabel) + 7*KScDefineWidth/2, minY(_titleLabel), 24*KScDefineWidth/2, 29*KScDefineWidth/2);
    }
    _everyDayMoneyLabel.frame = CGRectMake(width(_backView.frame) - everydayWidth - 13*KScDefineWidth/2, minY(_titleLabel), everydayWidth, 28*KScDefineWidth/2);
    _starImageView.frame = CGRectMake(minX(_titleLabel), maxY(_titleLabel) + TOPMARGIN*KScDefineWidth/2,115*KScDefineWidth/2, 22*KScDefineWidth/2);
//    _typeLabe.frame =  CGRectMake(width(_backView.frame) - 60*KScDefineWidth/2 - 13*KScDefineWidth/2, minY(_starImageView), 60*KScDefineWidth/2, 18*KScDefineWidth/2);
    if (picCount == 0) {
        _pictureView.frame = CGRectMake(width(_backView.frame) - 14*KScDefineWidth - 13*KScDefineWidth/2, minY(_starImageView), 14*KScDefineWidth, 14*KScDefineWidth);
    }else {
        _pictureView.frame = CGRectMake(width(_backView.frame) - 14*KScDefineWidth*(_pictureArray.count + 1) - 13*KScDefineWidth/2 - _pictureArray.count*5*KScDefineWidth, minY(_starImageView), 14*KScDefineWidth*(_pictureArray.count +1) + _pictureArray.count*5*KScDefineWidth, 14*KScDefineWidth);
    }
    
    _startTimeImageView.frame = CGRectMake(minX(_starImageView), maxY(_starImageView) + TOPMARGIN*KScDefineWidth + 1*KScDefineWidth,18*KScDefineWidth/2, 18*KScDefineWidth/2);
    _startTimeLabel.frame = CGRectMake(maxX(_startTimeImageView) + 6*KScDefineWidth/2, maxY(_starImageView) + TOPMARGIN*KScDefineWidth, 300*KScDefineWidth/2, 23*KScDefineWidth/2);
//    _distanceLabel.frame = CGRectMake(maxX(_startTimeLabel), minY(_startTimeLabel), 133*KScDefineWidth, 23*KScDefineWidth/2);
     _concernImageView.frame = CGRectMake(width(_backView.frame) - 82*KScDefineWidth/2 - LEFTMARGIN*KScDefineWidth, minY(_startTimeLabel) - 5*KScDefineWidth, 82*KScDefineWidth/2, 32*KScDefineWidth/2);
    _addressImageView.frame = CGRectMake(minX(_starImageView), maxY(_startTimeLabel) + TOPMARGIN*KScDefineWidth/2 + 1*KScDefineWidth/2, 18*KScDefineWidth/2, 24*KScDefineWidth/2);
    
//    _roadLabel.frame = CGRectMake(maxX(_addresslabel) + 9*KScDefineWidth, 161*KScDefineWidth, <#CGFloat width#>, <#CGFloat height#>)
//    _concernImageView.frame = CGRectMake(width(self.frame) - 82*KScDefineWidth/2 - LEFTMARGIN*KScDefineWidth - 10*KScDefineWidth/2, minY(_addresslabel), 82*KScDefineWidth/2, 32*KScDefineWidth/2);
    CGFloat addressWidth =[_addresslabel.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 80*KScDefineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12*KScDefineWidth]} context:nil].size.width;
     CGFloat distanceWidth =[_distanceLabel.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 80*KScDefineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12*KScDefineWidth]} context:nil].size.width;
    if (addressWidth + distanceWidth >= 265*KScreenWidth) {
        _addresslabel.frame = CGRectMake(maxX(_addressImageView) + 6*KScDefineWidth/2,maxY(_startTimeLabel) +TOPMARGIN*KScDefineWidth/2 , 265*KScDefineWidth - distanceWidth, 24*KScDefineWidth/2);
        _distanceLabel.frame = CGRectMake(maxX(_addresslabel), minY(_addresslabel), distanceWidth, 23*KScDefineWidth/2);
    }else {
        _addresslabel.frame = CGRectMake(maxX(_addressImageView) + 6*KScDefineWidth/2,maxY(_startTimeLabel) +TOPMARGIN*KScDefineWidth/2 , 265*KScDefineWidth - distanceWidth, 24*KScDefineWidth/2);
        _distanceLabel.frame = CGRectMake(width(_backView.frame) - LEFTMARGIN *KScDefineWidth- distanceWidth, minY(_addresslabel), distanceWidth, 23*KScDefineWidth/2);
    }
    
    _rightView.frame = CGRectMake(width(self.frame) - 10*KScDefineWidth/2, 0, 10*KScDefineWidth/2, height(self.frame));
}



// 设置信号量，当cell的vm被重新赋值时，更新cell显示的数据
- (void)setupSignal {
    
    @weakify(self);
    [RACObserve(self, viewModel) subscribeNext:^(CellViewModel *viewModel) {
        
        // 使用strong修饰self，防止在self在使用中被释放
        @strongify(self);
        // vm已经将要显示的文本处理好了，在cell中直接赋值就行
        [_starImageView setLevel:[viewModel.afterModel.star floatValue]];
        if ([viewModel.afterModel.star integerValue] == 3) {
            _flagImageView.image = [UIImage imageNamed:@"yinpai.png"];
        }else if ([_viewModel.afterModel.star integerValue] == 4) {
            _flagImageView.image = [UIImage imageNamed:@"jinpai.png"];
        }else if ([_viewModel.afterModel.star integerValue] == 5) {
            _flagImageView.image = [UIImage imageNamed:@"jinpai.png"];
        }else {
            _flagImageView.image = nil;
        }
        NSRange range = [viewModel.afterModel.name rangeOfString:@"保洁员"];
        if (range.location != NSNotFound) {
            _headLabel.text = @"保洁员";
        }else {
            _headLabel.text = viewModel.afterModel.name;
        }
        if ([viewModel.afterModel.parent_job_id integerValue] == 1) {
            _headLabel.textColor = LHColor(246, 168, 9);
            _headerImageView.image = [UIImage imageNamed:@"yuan1.png"];
        }else if([viewModel.afterModel.parent_job_id integerValue] == 2) {
            _headLabel.textColor = LHColor(25, 158, 253);
            _headerImageView.image = [UIImage imageNamed:@"yuan2.png"];
        }else if([viewModel.afterModel.parent_job_id integerValue] == 3){
            _headLabel.textColor = LHColor(51, 203, 171);
            _headerImageView.image = [UIImage imageNamed:@"yuan3.png"];
        }else if([viewModel.afterModel.parent_job_id integerValue] == 4){
            _headLabel.textColor = LHColor(246,138,30);
            _headerImageView.image = [UIImage imageNamed:@"yuan4.png"];
        }else if([viewModel.afterModel.parent_job_id integerValue] == 5){
            _headLabel.textColor = LHColor(69,194,104);
            _headerImageView.image = [UIImage imageNamed:@"yuan5.png"];
        }
        
        if ([viewModel.afterModel.auth integerValue] == 0) {
            _confirmImageView.image = nil;
        }else {
            _confirmImageView.image = [UIImage imageNamed:@"renzheng.png"];
        }
        _addressImageView.image = [UIImage imageNamed:@"LAddressImage.png"];
        _startTimeImageView.image = [UIImage imageNamed:@"LstartTime.png"];
        _titleLabel.text = viewModel.afterModel.project_name;
        
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:([_viewModel.afterModel.job_start_time integerValue] + 28800000)/1000.0];
        NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
        _startTimeLabel.text = [NSString stringWithFormat:@"开始时间：%@",[confromTimespStr componentsSeparatedByString:@" "][0]];
        _addresslabel.text = _viewModel.afterModel.address;
        //    _distanceLabel.text = [NSString stringWithFormat:@"%.2f千米",[_dataModle.distance integerValue]/1000.0];
        if ([_viewModel.afterModel.distance length] < 4) {
            _distanceLabel.text = [NSString stringWithFormat:@"%ld米",[_viewModel.afterModel.distance integerValue]];
        }else {
            _distanceLabel.text = [NSString stringWithFormat:@"%.2f千米",[_viewModel.afterModel.distance floatValue]/1000.0];
        }

        
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
