extern "C" {
  void my_cpp_function(int* a, int* b);
}

void my_cpp_function(int* a, int* b) {
  *b = *a + 42;
}
