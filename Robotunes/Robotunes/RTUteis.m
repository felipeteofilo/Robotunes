//
//  RTUteis.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 19/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTUteis.h"

@implementation RTUteis
+(BOOL)possuiConexao{
    Reachability *reachability=[Reachability reachabilityForInternetConnection];
    NetworkStatus status= [reachability currentReachabilityStatus];
    
    switch (status) {
        case NotReachable:
            return NO;
            break;
            
        default:
            return YES;
            break;
    }
}

+(BOOL)possuiConexaoServidor:(NSString*)urlServidor{
    Reachability *reachability=[Reachability reachabilityWithHostName:urlServidor];
    NetworkStatus status= [reachability currentReachabilityStatus];
    
    switch (status) {
        case NotReachable:
            return NO;
            break;
            
        default:
            return YES;
            break;
    }
}

+(NSDate*)formataData:(NSDate *)data{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:data];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [calendar dateFromComponents:components];

}

+ (int)diasEntreDataInicial:(NSDate*)dataInicial andDate:(NSDate*)dataFinal
{
    NSDate *dataIni;
    NSDate *dataFin;
    
    NSCalendar *calendario = [NSCalendar currentCalendar];
    
    [calendario rangeOfUnit:NSDayCalendarUnit startDate:&dataIni
                 interval:NULL forDate:dataInicial];
    [calendario rangeOfUnit:NSDayCalendarUnit startDate:&dataFin
                 interval:NULL forDate:dataFinal];
    
    
    
    NSDateComponents *difference = [calendario components:NSDayCalendarUnit
                                               fromDate:dataInicial toDate:dataFinal options:0];
    
    return abs((int)[difference day]);
}
@end