# MMAGMA

Musical MIDI Accompaniment book by Gilles Maire (MMA by GMA)

The documentation is in Markdown format in french language


To generate all the  documentations : 

~~~bash 
rm -rf build
cmake -S . -B build
cmake --build build --target cleanall
cmake --build build --target makedoc
~~~
