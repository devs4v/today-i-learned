This came from: http://stackoverflow.com/questions/3250467/what-is-inside-lib-file-of-static-library-statically-linked-dynamic-library-an

The question was:
What is inside .lib file of Static library, Statically linked dynamic library and dynamically linked dynamic library?

Answers that I liked:
A LIB file is used to build your program, it only exists on your build machine and you don't ship it. There are two kinds. A static link library is a bag of .obj files, collected into a single file. The linker picks any chunks of code from the file when it needs to resolve an external identifier.

But more relevant to DLLs, a LIB file can also be an import library. It is then a simple small file that includes the name of the DLL and a list of all the functions exported by the DLL. You'll need to provide it to the linker when you build a program that uses the DLL so it knows that an external identifier is actually a function exported by the DLL. The linker uses the import library to add entries to the import table for the EXE. Which is then in turn used by Windows at runtime to figure out what DLLs need to be loaded to run the program.

Here's a summary:

|Linking  | Static        | DLL                  | LoadLibrary       |
|---------|---------------|----------------------|------------------
|API code lives| In your compiled program  | In the DLL           | In the DLL        |
|---------|---------------|----------------------|-------------------
|Function calls | Direct, may be elided  | Indirect via table filled automatically  | Indirect via your own function parts
|---------|---------------|----------------------|-------------------
|Burden   | Compiler      | Compiler/OS          | You/OS
