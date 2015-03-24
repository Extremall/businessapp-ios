// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BAPhoto.h instead.

#import <CoreData/CoreData.h>


extern const struct BAPhotoAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *photoID;
	__unsafe_unretained NSString *url;
} BAPhotoAttributes;

extern const struct BAPhotoRelationships {
} BAPhotoRelationships;

extern const struct BAPhotoFetchedProperties {
} BAPhotoFetchedProperties;






@interface BAPhotoID : NSManagedObjectID {}
@end

@interface _BAPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BAPhotoID*)objectID;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* photoID;



@property int32_t photoIDValue;
- (int32_t)photoIDValue;
- (void)setPhotoIDValue:(int32_t)value_;

//- (BOOL)validatePhotoID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;






@end

@interface _BAPhoto (CoreDataGeneratedAccessors)

@end

@interface _BAPhoto (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSNumber*)primitivePhotoID;
- (void)setPrimitivePhotoID:(NSNumber*)value;

- (int32_t)primitivePhotoIDValue;
- (void)setPrimitivePhotoIDValue:(int32_t)value_;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;




@end
