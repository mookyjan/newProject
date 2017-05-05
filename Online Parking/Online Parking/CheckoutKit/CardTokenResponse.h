//
//  CardTokenResponse.h
//  checkoutObjC
//
//  Created by Nicolas on 30/03/2016.
//  Copyright © 2016 checkout.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnlineParking-swift.h"

@interface CardTokenResponse : NSObject

@property (nonatomic, retain) NSString *cardToken;
@property (nonatomic, assign) BOOL liveMode;
@property (nonatomic, retain) NSString *created;
@property (nonatomic, assign) BOOL used;
@property (nonatomic, retain) Card *card;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
