//
//  AMapNaviStatisticsInfo.h
//  AMapNaviKit
//
//  Created by AutoNavi on 15/12/28.
//  Copyright © 2015年 AutoNavi. All rights reserved.
//

#import "AMapNaviCommonObj.h"

/*!
 @brief 导航统计信息(只适用于实时导航)
 */
@interface AMapNaviStatisticsInfo : NSObject<NSCopying,NSCoding>

/*!
 @brief 实际的行驶用时(包括中途停车时间,单位:秒)
 */
@property (nonatomic, assign) NSInteger actualDrivenTime;

/*!
 @brief 实际的行驶里程(单位:米)
 */
@property (nonatomic, assign) NSInteger actualDrivenDisance;

/*!
 @brief 平均速度(实际的行驶里程/实际的行驶用时,单位:公里/小时)
 */
@property (nonatomic, assign) NSInteger averageSpeed;

/*!
 @brief 最高速度(单位:公里/小时)
 */
@property (nonatomic, assign) NSInteger highestSpeed;

/*!
 @brief 电子眼播报的超速次数,关闭电子眼播报(AMapNaviManager.updateCameraInfo)则没有计数
 */
@property (nonatomic, assign) NSInteger overspeedCount;

/*!
 @brief 偏航次数
 */
@property (nonatomic, assign) NSInteger rerouteCount;

/*!
 @brief 急刹车次数
 */
@property (nonatomic, assign) NSInteger brakesCount;

/*!
 @brief 等待及拥堵时间(单位:秒)
 */
@property (nonatomic, assign) NSInteger slowTime;

@end
