all:
	gfortran -c PluginFortran.f95 -o PluginFortran.o
	g++ -c CPPExported.cpp -o CPPExported.o
	gfortran PluginFortran.o CPPExported.o -o main
