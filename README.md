AME++

Greg Christian, TRIUMF
gchristian@triumf.ca
February 2014



Simple library to facilitate extraction of atomic (or ionic) masses in C++ programs.
The mass data can be read in from any text document formatted in the standard way
of the atomic mass evaluation reports. The most recent publication of the AME, ame12
is included with the distribution, and is the default input file.

Also defines ROOT dictionaries to allow the associated classes to be used in a CINT
session. These are generated and compiled automatically if the ROOTSYS environment
is properly defined on the system.

To compile the shared library, simply type 'make'. This will generate libAme.so which you
can then link into your executables. There is no "install" option - if you want to put 
the library elsewhere, simply copy it yourself. For an example program using te library, 
see 'example.cxx'. If you use ROOT, you can also load the library into a CINT session by
doing:

   [] gSystem->Load("/path/to/here/libAme.so");

Then you can use the class from within CINT.
