// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BANews.h instead.

#import <CoreData/CoreData.h>


extern const struct BANewsAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *newsID;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
} BANewsAttributes;

extern const struct BANewsRelationships {
} BANewsRelationships;

extern const struct BANewsFetchedProperties {
} BANewsFetchedProperties;








@interface BANewsID : NSManagedObjectID {}
@end

@interface _BANews : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BANewsID*)objectID;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* newsID;



@property int32_t newsIDValue;
- (int32_t)newsIDValue;
- (void)setNewsIDValue:(int32_t)value_;

//- (BOOL)validateNewsID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int32_t typeValue;
- (int32_t)typeValue;
- (void)setTypeValue:(int32_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _BANews (CoreDataGeneratedAccessors)

@end

@interface _BANews (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSNumber*)primitiveNewsID;
- (void)setPrimitiveNewsID:(NSNumber*)value;

- (int32_t)primitiveNewsIDValue;
- (void)setPrimitiveNewsIDValue:(int32_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int32_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int32_t)value_;




@end
