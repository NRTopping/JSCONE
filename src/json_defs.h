/**
 * @file json_defs.h
 * @author NRTopping
 * @date September 13, 2015
 * 
 * This file contains common json definitons and structures that are used
 * throughout JSCONE.  
 */

enum json_type { 
  JSON_TYPE_EOF,    // Marks end of tokens TODO remove if use linked lists
  JSON_TYPE_STRING,
  JSON_TYPE_NUMBER,
  JSON_TYPE_OBJECT,
  JSON_TYPE_TRUE,
  JSON_TYPE_FALSE,
  JSON_TYPE_NULL,
  JSON_TYPE_ARRAY,
};
