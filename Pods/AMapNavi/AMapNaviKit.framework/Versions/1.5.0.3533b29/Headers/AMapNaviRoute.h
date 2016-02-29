//
//  AMapNaviRoute.h
//  AMapNaviKit
//
//  Created by 刘博 on 14-7-11.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMapNaviCommonObj.h"

/// AMapNaviLink --组成--> AMapNaviSegment --组成--> AMapNaviRoute

#pragma mark - AMapNaviLink

/*!
 @brief 分段的Link信息
 */
@interface AMapNaviLink : NSObject<NSCopying>

/*!
 @brief Link的所有坐标
 */
@property (nonatomic, strong) NSArray<AMapNaviPoint *> *coordinates;

/*!
 @brief Link的长度(单位:米)
 */
@property (nonatomic, assign) NSInteger length;

/*!
 @brief Link的预估时间(单位:秒)
 */
@property (nonatomic, assign) NSInteger time;

/*!
 @brief Link的道路名称
 */
@property (nonatomic, strong) NSString *roadName;

/*!
 @brief Link的道路类型
 */
@property (nonatomic, assign) AMapNaviRoadClass roadClass;

/*!
 @brief Link的FormWay信息
 */
@property (nonatomic, assign) AMapNaviFormWay formWay;

/*!
 @brief Link是否有红绿灯
 */
@property (nonatomic, assign) BOOL isHadTrafficLights;

@end

#pragma mark - AMapNaviSegment

/*!
 @brief 路径的分段信息
 */
@interface AMapNaviSegment : NSObject<NSCopying>

/*!
 @brief 分段的所有坐标
 */
@property (nonatomic, strong) NSArray<AMapNaviPoint *> *coordinates;

/*!
 @brief 分段的所有Link
 */
@property (nonatomic, strong) NSArray<AMapNaviLink *> *links;

/*!
 @brief 分段的长度(单位:米)
 */
@property (nonatomic, assign) NSInteger length;

/*!
 @brief 分段的预估时间(单位:秒)
 */
@property (nonatomic, assign) NSInteger time;

/*!
 @brief 分段的转向类型
 */
@property (nonatomic, assign) AMapNaviIconType iconType;

/*!
 @brief 分段的收费路长度(单位:米)
 */
@property (nonatomic, assign) NSInteger chargeLength;

/*!
 @brief 分段的收费金额
 */
@property (nonatomic, assign) NSInteger tollCost;

@end

#pragma mark - AMapNaviRoute

/*!
 @brief 导航路径信息
 */
@interface AMapNaviRoute : NSObject<NSCopying>

/*!
 @brief 导航路径总长度(单位：米)
 */
@property (nonatomic, assign) NSInteger routeLength;

/*!
 @brief 导航路径所需的时间(单位：秒)
 */
@property (nonatomic, assign) NSInteger routeTime;

/*!
 @brief 导航路线最小坐标点和最大坐标点围成的矩形区域
 */
@property (nonatomic, strong) AMapNaviPointBounds *routeBounds;

/*!
 @brief 导航路线的中心点，即导航路径的最小外接矩形对角线的交点。
 */
@property (nonatomic, strong) AMapNaviPoint *routeCenterPoint;

/*!
 @brief 导航路线的所有形状点
 */
@property (nonatomic, strong) NSArray<AMapNaviPoint *> *routeCoordinates;

/*!
 @brief 路线方案的起点坐标
 */
@property (nonatomic, strong) AMapNaviPoint *routeStartPoint;

/*!
 @brief 路线方案的终点坐标
 */
@property (nonatomic, strong) AMapNaviPoint *routeEndPoint;

/*!
 @brief 导航路线的所有分段
 */
@property (nonatomic, strong) NSArray<AMapNaviSegment *> *routeSegments;

/*!
 @brief 导航路线上分段的总数
 */
@property (nonatomic, assign) NSInteger routeSegmentCount;

/*!
 @brief 导航路线上红绿灯的总数
 */
@property (nonatomic, assign) NSInteger routeTrafficLightCount;

/*!
 @brief 导航路线的路径计算策略（只适用于驾车导航）
 */
@property (nonatomic, assign) AMapNaviDrivingStrategy routeStrategy;

/*!
 @brief 导航路线的花费金额(单位：元)
 */
@property (nonatomic, assign) NSInteger routeTollCost;

/*!
 @brief 路径的途经点坐标
 */
@property (nonatomic, strong) NSArray<AMapNaviPoint *> *wayPoints;

/*!
 @brief 路径的途经点所在segment段的index
 */
@property (nonatomic, strong) NSIndexPath *wayPointsIndexes;

@end
