//
//  Movie.h
//  Flixter
//
//  Created by Gui David on 6/24/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSURL *posterUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
