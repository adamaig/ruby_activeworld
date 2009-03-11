
#include "ruby.h"
#include "Aw.h"

#ifndef _RUBY_ACTIVEWORLD_H_
#define _RUBY_ACTIVEWORLD_H_

typedef struct { 
  void* c_self; 
  VALUE ruby_self; 
} RUBY_AW_APPLICATION; 

#endif