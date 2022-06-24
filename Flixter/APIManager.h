//
//  APIManager.h
//  Flixter
//
//  Created by Gui David on 6/24/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (void)fetchNowPlaying:(void(^)(NSArray *movies, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
