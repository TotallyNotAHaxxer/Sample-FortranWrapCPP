MODULE Fortran_Example_Binder                                         ! Declare our module to better automate the C++ export process
  USE ISO_C_BINDING                                                   ! Start using the ISO C binding for linkage
  IMPLICIT NONE                                                       ! We do not want any weird typing here so we decalre implicit none
  interface                                                           ! Create a new interface type for the C bindings in the module
    subroutine my_cpp_function(a, b) bind(C, name="my_cpp_function")  ! declare the name of the functions interface and signature for the bind
      import :: C_INT                                                 ! import a C INTEGER data type (int)
      integer(C_INT), intent(in)  :: a                                ! decalre the intent of a which in this case is to be an input variable
      integer(C_INT), intent(out) :: b                                ! declare the intent of b which in this case is to be an output variable
    end subroutine my_cpp_function                                    ! end the subroutine
  end interface                                                       ! end the interface
END MODULE Fortran_Example_Binder                                     ! end the module
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Starting our sector for the module
                                                                      !
PROGRAM MAIN                                                          ! New break for programmatic entry point
  USE Fortran_Example_Binder                                          ! Import module above
  IMPLICIT NONE                                                       ! declaring implicit typing to be none
  INTEGER :: a, b                                                     ! Intended inputs
  a = 20                                                              ! basic assignment
                                                                      ! - 
  CALL my_cpp_function(a, b)                                          ! Call the subroutine
                                                                      !
  write(*, *) "Result from exported function : ", b                   ! output the variable
END PROGRAM MAIN
