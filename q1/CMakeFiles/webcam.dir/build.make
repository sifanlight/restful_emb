# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sinlap/embProject/bruh/q1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sinlap/embProject/bruh/q1

# Include any dependencies generated for this target.
include CMakeFiles/webcam.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/webcam.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/webcam.dir/flags.make

CMakeFiles/webcam.dir/src/webcam.cpp.o: CMakeFiles/webcam.dir/flags.make
CMakeFiles/webcam.dir/src/webcam.cpp.o: src/webcam.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sinlap/embProject/bruh/q1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/webcam.dir/src/webcam.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/webcam.dir/src/webcam.cpp.o -c /home/sinlap/embProject/bruh/q1/src/webcam.cpp

CMakeFiles/webcam.dir/src/webcam.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/webcam.dir/src/webcam.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sinlap/embProject/bruh/q1/src/webcam.cpp > CMakeFiles/webcam.dir/src/webcam.cpp.i

CMakeFiles/webcam.dir/src/webcam.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/webcam.dir/src/webcam.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sinlap/embProject/bruh/q1/src/webcam.cpp -o CMakeFiles/webcam.dir/src/webcam.cpp.s

CMakeFiles/webcam.dir/src/webcam.cpp.o.requires:

.PHONY : CMakeFiles/webcam.dir/src/webcam.cpp.o.requires

CMakeFiles/webcam.dir/src/webcam.cpp.o.provides: CMakeFiles/webcam.dir/src/webcam.cpp.o.requires
	$(MAKE) -f CMakeFiles/webcam.dir/build.make CMakeFiles/webcam.dir/src/webcam.cpp.o.provides.build
.PHONY : CMakeFiles/webcam.dir/src/webcam.cpp.o.provides

CMakeFiles/webcam.dir/src/webcam.cpp.o.provides.build: CMakeFiles/webcam.dir/src/webcam.cpp.o


# Object files for target webcam
webcam_OBJECTS = \
"CMakeFiles/webcam.dir/src/webcam.cpp.o"

# External object files for target webcam
webcam_EXTERNAL_OBJECTS =

bin/webcam: CMakeFiles/webcam.dir/src/webcam.cpp.o
bin/webcam: CMakeFiles/webcam.dir/build.make
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_gapi.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_stitching.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_alphamat.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_aruco.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_barcode.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_bgsegm.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_bioinspired.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_ccalib.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_cvv.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_dnn_objdetect.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_dnn_superres.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_dpm.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_face.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_freetype.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_fuzzy.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_hdf.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_hfs.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_img_hash.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_intensity_transform.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_line_descriptor.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_mcc.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_quality.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_rapid.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_reg.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_rgbd.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_saliency.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_sfm.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_stereo.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_structured_light.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_superres.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_surface_matching.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_tracking.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_videostab.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_wechat_qrcode.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_xfeatures2d.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_xobjdetect.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_xphoto.so.4.5.3
bin/webcam: /usr/local/lib/libpaho-mqttpp3.a
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_shape.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_highgui.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_datasets.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_plot.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_text.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_ml.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_phase_unwrapping.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_optflow.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_ximgproc.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_video.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_videoio.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_dnn.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_imgcodecs.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_objdetect.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_calib3d.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_features2d.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_flann.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_photo.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_imgproc.so.4.5.3
bin/webcam: /home/sinlap/opencv/installation/OpenCV-master/lib/libopencv_core.so.4.5.3
bin/webcam: /usr/local/lib/libpaho-mqtt3as.so
bin/webcam: /usr/lib/x86_64-linux-gnu/libssl.so
bin/webcam: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/webcam: CMakeFiles/webcam.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sinlap/embProject/bruh/q1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/webcam"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/webcam.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/webcam.dir/build: bin/webcam

.PHONY : CMakeFiles/webcam.dir/build

CMakeFiles/webcam.dir/requires: CMakeFiles/webcam.dir/src/webcam.cpp.o.requires

.PHONY : CMakeFiles/webcam.dir/requires

CMakeFiles/webcam.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/webcam.dir/cmake_clean.cmake
.PHONY : CMakeFiles/webcam.dir/clean

CMakeFiles/webcam.dir/depend:
	cd /home/sinlap/embProject/bruh/q1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sinlap/embProject/bruh/q1 /home/sinlap/embProject/bruh/q1 /home/sinlap/embProject/bruh/q1 /home/sinlap/embProject/bruh/q1 /home/sinlap/embProject/bruh/q1/CMakeFiles/webcam.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/webcam.dir/depend

