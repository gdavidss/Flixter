//
//  Movie.m
//  Flixter
//
//  Created by Gui David on 6/24/22.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    self.title = dictionary[@"title"];
    self.synopsis = dictionary[@"overview"];
    
    NSString *posterURLString = dictionary[@"poster_path"];
    if (posterURLString != nil) {
        NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
        NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
        NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
        self.posterUrl = posterURL;
    }
        
     return self;
    }

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries {
    // self.movies = [[NSMutableArray alloc] init];
    //NSArray *dictionaries = dataDictionary[@"results"];
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in dictionaries) {
        Movie *movie = [[[Movie alloc] init] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    return (NSArray *)movies;
}

@end
