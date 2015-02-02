//
//  MovieQuote.h
//  MovieQuotes
//
//  Created by Philip Ross on 1/27/15.
//  Copyright (c) 2015 Philip Ross. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MovieQuote : NSManagedObject

@property (nonatomic, retain) NSString * movie;
@property (nonatomic, retain) NSString * quote;
@property (nonatomic, retain) NSDate * lastTouchDate;

@end
