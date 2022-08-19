cmake_minimum_required(VERSION 3.3)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin") 
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
SET(OpenCV_DIR ~/opencv/installation/OpenCV-master/lib/cmake/opencv4)
project(restServer)
#set(CMAKE_CXX_STANDARD 11)
#set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
#set(Boost_USE_STATIC_LIBS OFF) 
#set(Boost_USE_MULTITHREADED ON)  
#set(Boost_USE_STATIC_RUNTIME OFF) 
#set (CMAKE_PREFIX_PATH /home/iman/boost/)
#FIND_PACKAGE( Boost 1.73 COMPONENTS system REQUIRED )
find_package( OpenCV REQUIRED )
set(Boost_INCLUDE_DIR ~/boost)
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} ${OpenCV_INCLUDE_DIRS} )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES src/httpServer.cpp)

add_executable (restServer
    ${BOOST_BEAST_FILES}
     ${SOURCE_FILES}
    src/Jamfile
    src/fields_alloc.hpp
    src/httpServer.cpp
)

target_link_libraries(restServer ${Boost_LIBRARIES} ${OpenCV_LIBS} -lpthread)
