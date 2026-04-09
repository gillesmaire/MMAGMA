cmake_minimum_required(VERSION 3.16)
project(makedoc NONE)

find_program(PANDOC_EXECUTABLE pandoc REQUIRED)
find_program(PDF_ENGINE tectonic)
if(NOT PDF_ENGINE)
    find_program(PDF_ENGINE xelatex)
endif()

set(LANGUAGES fr en)

set(ALL_HTML)
set(ALL_PDF)

foreach(LANG ${LANGUAGES})

    set(SRC_ROOT  "${CMAKE_SOURCE_DIR}/${LANG}")
    set(HTML_ROOT "${SRC_ROOT}/html")
    set(PDF_ROOT  "${SRC_ROOT}/pdf")

    if(EXISTS "${SRC_ROOT}")

        file(GLOB_RECURSE MD_FILES CONFIGURE_DEPENDS "${SRC_ROOT}/*.md")

        # Filtrer pour ne pas inclure les fichiers déjà générés
        list(FILTER MD_FILES EXCLUDE REGEX "/html/")
        list(FILTER MD_FILES EXCLUDE REGEX "/pdf/")

        # -------- HTML : un fichier par MD ----------
        foreach(MD ${MD_FILES})
            file(RELATIVE_PATH REL_PATH "${SRC_ROOT}" "${MD}")

            set(HTML_FILE "${HTML_ROOT}/${REL_PATH}")
            string(REGEX REPLACE "\\.md$" ".html" HTML_FILE "${HTML_FILE}")
            get_filename_component(HTML_DIR "${HTML_FILE}" DIRECTORY)

            add_custom_command(
                OUTPUT "${HTML_FILE}"
                COMMAND ${CMAKE_COMMAND} -E make_directory "${HTML_DIR}"
                COMMAND ${PANDOC_EXECUTABLE} "${MD}" -o "${HTML_FILE}" -V lang=${LANG}
                DEPENDS "${MD}"
                VERBATIM
            )

            list(APPEND ALL_HTML "${HTML_FILE}")
        endforeach()

        # -------- PDF : un PDF unique par langue ----------
        if(PDF_ENGINE AND MD_FILES)
            set(PDF_FILE "${PDF_ROOT}/${LANG}.pdf")
            get_filename_component(PDF_DIR "${PDF_FILE}" DIRECTORY)

            add_custom_command(
                OUTPUT "${PDF_FILE}"
                COMMAND ${CMAKE_COMMAND} -E make_directory "${PDF_DIR}"
                COMMAND ${PANDOC_EXECUTABLE}
                        ${MD_FILES}
                        -o "${PDF_FILE}"
                        --pdf-engine=${PDF_ENGINE}
                        -V lang=${LANG}
                DEPENDS ${MD_FILES}
                VERBATIM
            )

            list(APPEND ALL_PDF "${PDF_FILE}")
        endif()

    endif()
endforeach()

add_custom_target(makehtml DEPENDS ${ALL_HTML})
add_custom_target(makepdf DEPENDS ${ALL_PDF})
add_custom_target(makedoc DEPENDS ${ALL_HTML} ${ALL_PDF})
