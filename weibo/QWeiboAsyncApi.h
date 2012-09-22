//
//  QWeiboAsyncApi.h
//  QWeiboSDK4iOSDemo
//
//  Created   on 11-1-18.
//   
//

#import <Foundation/Foundation.h>
#import "QWeiboSyncApi.h"


@interface QWeiboAsyncApi : NSObject {

}

- (NSURLConnection *)getHomeMsgWithConsumerKey:(NSString *)aConsumerKey
						 consumerSecret:(NSString *)aConsumerSecret 
						 accessTokenKey:(NSString *)aAccessTokenKey 
					  accessTokenSecret:(NSString *)aAccessTokenSecret 
							 resultType:(ResultType)aResultType 
							  pageFlage:(PageFlag)aPageFlag 
								nReqNum:(NSInteger)aReqNum 
							   delegate:(id)aDelegate;

- (NSURLConnection *)publishMsgWithConsumerKey:(NSString *)aConsumerKey 
						 consumerSecret:(NSString *)aConsumerSecret 
						 accessTokenKey:(NSString *)aAccessTokenKey 
					  accessTokenSecret:(NSString *)aAccessTokenSecret 
								content:(NSString *)aContent 
							  imageFile:(NSString *)aImageFile 
							 resultType:(ResultType)aResultType 
							   delegate:(id)aDelegate;

- (NSURLConnection *)getCommentRelayWithConsumerKey:(NSString *)aConsumerKey
                                     consumerSecret:(NSString *)aConsumerSecret 
                                     accessTokenKey:(NSString *)aAccessTokenKey
                                  accessTokenSecret:(NSString *)aAccessTokenSecret
                                         resultType:(ResultType)aResultType
                                               flag:(int)aflag
                                             rootId:(NSString *)arootId
                                          pageFlage:(PageFlag)aPageFlag
                                           pageTime:(NSString *)apageTime
                                             reqNum:(NSInteger)areqNum
                                          twitterId:(NSInteger)atwitterId
                                           delegate:(id)adelegate;

- (NSURLConnection *)addtWithConsumerKey:(NSString *)aConsumerKey
                           consumerSecret:(NSString *)aConsumerSecret 
                          accessTokenKey:(NSString *)aAccessTokenKey 
                       accessTokenSecret:(NSString *)aAccessTokenSecret 
                              resultType:(ResultType)aResultType 
                                 weiboId:(NSString *)aId
                                delegate:(id)aDelegate;

- (NSURLConnection *)getInfoWithConsumerKey:(NSString *)aConsumerKey
                                consumerSecret:(NSString *)aConsumerSecret 
                                accessTokenKey:(NSString *)aAccessTokenKey 
                             accessTokenSecret:(NSString *)aAccessTokenSecret 
                                    resultType:(ResultType)aResultType 
                                      delegate:(id)aDelegate;

- (NSURLConnection *)re_addtWithConsumerKey:(NSString *)aConsumerKey
                             consumerSecret:(NSString *)aConsumerSecret 
                             accessTokenKey:(NSString *)aAccessTokenKey 
                          accessTokenSecret:(NSString *)aAccessTokenSecret 
                                 resultType:(ResultType)aResultType 
                                    content:(NSString *)acontent
                                   clientip:(NSString *)aclientip
                                       jing:(NSString *)ajing
                                        wei:(NSString *)awei
                                       reid:(NSString *)areid
                                delegate:(id)aDelegate;

- (NSURLConnection *)commentWithConsumerKey:(NSString *)aConsumerKey
                             consumerSecret:(NSString *)aConsumerSecret 
                             accessTokenKey:(NSString *)aAccessTokenKey 
                          accessTokenSecret:(NSString *)aAccessTokenSecret 
                                 resultType:(ResultType)aResultType 
                                    content:(NSString *)acontent
                                   clientip:(NSString *)aclientip
                                       jing:(NSString *)ajing
                                        wei:(NSString *)awei
                                       reid:(NSString *)areid
                                   delegate:(id)aDelegate;

- (NSURLConnection *)getlist_tWithConsumerKey:(NSString *)aConsumerKey
                               consumerSecret:(NSString *)aConsumerSecret 
                               accessTokenKey:(NSString *)aAccessTokenKey 
                            accessTokenSecret:(NSString *)aAccessTokenSecret 
                                   resultType:(ResultType)aResultType 
                                    pageFlage:(PageFlag)aPageFlag 
                                     pagetime:(NSString *)aPageTime
                                      nReqNum:(NSInteger)aReqNum 
                                       lastid:(NSString *)alastid
                                     delegate:(id)aDelegate;

- (NSURLConnection *)getmentionWithConsumerKey:(NSString *)aConsumerKey
                                consumerSecret:(NSString *)aConsumerSecret 
                                accessTokenKey:(NSString *)aAccessTokenKey 
                             accessTokenSecret:(NSString *)aAccessTokenSecret 
                                    resultType:(ResultType)aResultType 
                                     pageFlage:(PageFlag)aPageFlag 
                                      pageTime:(NSString *)aPageTime
                                       nReqNum:(NSInteger)aReqNum 
                                        lastid:(NSString *)aLastId
                                   contenttype:(NSString *)aContenttype
                                      delegate:(id)aDelegate;
@end
