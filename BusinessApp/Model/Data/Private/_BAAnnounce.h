// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BAAnnounce.h instead.

#import <CoreData/CoreData.h>


extern const struct BAAnnounceAttributes {
	__unsafe_unretained NSString *announceID;
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
} BAAnnounceAttributes;

extern const struct BAAnnounceRelationships {
} BAAnnounceRelationships;

extern const struct BAAnnounceFetchedProperties {
} BAAnnounceFetchedProperties;








@interface BAAnnounceID : NSManagedObjectID {}
@end

@interface _BAAnnounce : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BAAnnounceID*)objectID;





@property (nonatomic, strong) NSNumber* announceID;



@property int32_t announceIDValue;
- (int32_t)announceIDValue;
- (void)setAnnounceIDValue:(int32_t)value_;

//- (BOOL)validateAnnounceID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageURL;



//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int32_t typeValue;
- (int32_t)typeValue;
- (void)setTypeValue:(int32_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _BAAnnounce (CoreDataGeneratedAccessors)

@end

@interface _BAAnnounce (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAnnounceID;
- (void)setPrimitiveAnnounceID:(NSNumber*)value;

- (int32_t)primitiveAnnounceIDValue;
- (void)setPrimitiveAnnounceIDValue:(int32_t)value_;




- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int32_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int32_t)value_;




@end
