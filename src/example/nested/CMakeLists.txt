
set(PYX_FILES 
      impl.pyx
    )

foreach(PYX_FILE ${PYX_FILES})
  get_filename_component(CY_NAME ${PYX_FILE} NAME_WE)
  message("Name without extension: ${CY_NAME}")
  set(CPP_FILE "${CMAKE_CURRENT_BINARY_DIR}/${CY_NAME}.cpp")
  set(CY_FILE "${CMAKE_CURRENT_SOURCE_DIR}/${CY_NAME}.pyx")
  set(PXD_FILE "${CMAKE_CURRENT_SOURCE_DIR}/${CY_NAME}.pxd")

  add_custom_command(
    OUTPUT ${CPP_FILE}
    DEPENDS ${CY_FILE}
    VERBATIM
    COMMAND ${CYTHON} --cplus ${CY_FILE} --include-dir ${CMAKE_CURRENT_SOURCE_DIR} -o ${CPP_FILE}
    COMMENT "Building ${CPP_FILE}"
  )

  python_add_library(${CY_NAME} MODULE "${CPP_FILE}" WITH_SOABI)
  target_link_directories(${CY_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
  target_include_directories(${CY_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
  install(TARGETS ${CY_NAME} DESTINATION ${SKBUILD_PROJECT_NAME}/nested)
endforeach()
