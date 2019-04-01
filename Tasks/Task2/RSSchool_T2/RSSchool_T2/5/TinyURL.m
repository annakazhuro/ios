#import "TinyURL.h"

@implementation TinyURL
// your code here

- (NSURL *)encode:(NSURL *)originalURL {
    [originalURL retain];
    NSData *nsdata = [originalURL dataRepresentation];
    NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
    NSURL* shortenedURL = [NSURL URLWithString:base64Encoded];
    
    [base64Encoded release];
    
    return shortenedURL;
}


- (NSURL *)decode:(NSURL *)shortenedURL {
    [shortenedURL retain];
    NSString* stringFromShortenedURL = [shortenedURL absoluteString];
    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:stringFromShortenedURL options:0];
    NSString *base64Decoded = [[NSString alloc] initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    NSURL* fullURL = [NSURL URLWithString:base64Decoded];
    
    [base64Decoded release];
    
    return fullURL;
}

@end
