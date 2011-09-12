//
//  DataAccess.h
//  FlutterApp2
//
//  Created by Dev on 04.01.11.
//  Copyright 2011 Defitech. All rights reserved.
//
//  This class defines an interface for accessing data on the device file system.
//  It will NOT be used in the final version of the app, since all data will be stored in an SQLite database.
//  It fact this class is already no longer in use, and should not be used any more. The class DB
//  has been created to interact with the SQLite database, and should be used instead. 


#import <Foundation/Foundation.h>


@interface DataAccess : NSObject {

}


// return current directory
+(NSString*) docDirectory;

// return current directory and append path
+(NSString*) docDirectoryWithPath:(NSString*)path;

//Create a new directory inside the Documents directory
+ (void)createDirectory:(NSString *)dirPath;

//Check if the file given by filePath
+ (BOOL)fileExists:(NSString *)filePath;

//Write the string to the filePath
+ (BOOL)writeToFile:(NSString*)str  filePath:(NSString *)filePath ;

//Read String from file
+(NSString*)readFromFile:(NSString *)filePath;

//List all files in a given folder and returns an array containing these files 
+(NSArray*)arrayOfFilesInFolder:(NSString*) path;

@end