
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fcray-pointer -ffree-line-length-none -fno-range-check -fbacktrace")

if(DEBUG)
    message("DEBUG is       ENABLED")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Wall -O0 -ggdb -fno-unsafe-math-optimizations -frounding-math -fsignaling-nans -ffpe-trap=invalid,zero,overflow -fbounds-check")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O0 -ggdb")
else()
    message("DEBUG is       disabled (optimized build)")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O2 -fno-range-check")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2")
endif()


if(REPRO)
    message("REPRO is       ENABLED")
    if(APPLE)
        set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O0 -ggdb")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0")
    else()
        set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O2 -ggdb")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2")
    endif()
else()
    message("REPRO is       disabled")
endif()


if(32BIT)
    message("32BIT is       ENABLED")
    add_definitions(-DOVERLOAD_R4)
    add_definitions(-DOVERLOAD_R8)
else()
    message("32BIT is       disabled")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fdefault-real-8 -fdefault-double-8")
endif()


if(OPENMP)
    message("OPENMP is      ENABLED")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fopenmp")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fopenmp")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fopenmp")
    add_definitions(-DOPENMP)
else()
    message("OPENMP is      disabled")
endif()

if(AVX2)
    message("AVX2 is        ENABLED")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
else()
    message("AVX2 is        disabled")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
endif()

if(INLINE_POST)
    message("INLINE_POST is ENABLED")
else()
    message("INLINE_POST is disabled")
endif()