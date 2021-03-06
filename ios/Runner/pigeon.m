// Autogenerated from Pigeon (v3.1.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface Book ()
+ (Book *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation Book
+ (instancetype)makeWithTitle:(nullable NSString *)title
    author:(nullable NSString *)author
    image:(nullable NSString *)image {
  Book* pigeonResult = [[Book alloc] init];
  pigeonResult.title = title;
  pigeonResult.author = author;
  pigeonResult.image = image;
  return pigeonResult;
}
+ (Book *)fromMap:(NSDictionary *)dict {
  Book *pigeonResult = [[Book alloc] init];
  pigeonResult.title = GetNullableObject(dict, @"title");
  pigeonResult.author = GetNullableObject(dict, @"author");
  pigeonResult.image = GetNullableObject(dict, @"image");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"title" : (self.title ?: [NSNull null]),
    @"author" : (self.author ?: [NSNull null]),
    @"image" : (self.image ?: [NSNull null]),
  };
}
@end

@interface BookApiCodecReader : FlutterStandardReader
@end
@implementation BookApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [Book fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface BookApiCodecWriter : FlutterStandardWriter
@end
@implementation BookApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[Book class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface BookApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation BookApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[BookApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[BookApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *BookApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    BookApiCodecReaderWriter *readerWriter = [[BookApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void BookApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<BookApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.BookApi.search"
        binaryMessenger:binaryMessenger
        codec:BookApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(searchKeyword:error:)], @"BookApi api (%@) doesn't respond to @selector(searchKeyword:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_keyword = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        NSArray<Book *> *output = [api searchKeyword:arg_keyword error:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
