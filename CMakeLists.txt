cmake_minimum_required(VERSION 3.16)
project(MMAGMA)

# =========================================================
# Répertoires
# =========================================================
set(SRC_DIR ${CMAKE_SOURCE_DIR}/fr)
set(HTML_DIR ${SRC_DIR}/html)

file(MAKE_DIRECTORY ${HTML_DIR})

# =========================================================
# Chapitres Markdown
# =========================================================
file(GLOB CHAPTERS ${SRC_DIR}/chapitre-*.md)
list(SORT CHAPTERS)

# =========================================================
# 1. HTML par chapitre
# =========================================================
set(HTML_FILES)

foreach(CHAP ${CHAPTERS})
    get_filename_component(NAME ${CHAP} NAME_WE)
    set(OUT_FILE ${HTML_DIR}/${NAME}.html)

    add_custom_command(
        OUTPUT ${OUT_FILE}
        COMMAND pandoc
            ${CHAP}
            -s
            --metadata title="${NAME}"
            -o ${OUT_FILE}
        DEPENDS ${CHAP}
        VERBATIM
    )

    list(APPEND HTML_FILES ${OUT_FILE})
endforeach()

# =========================================================
# 2. INDEX (TOC propre SANS contenu)
# => version robuste (Python, pas bash)
# =========================================================

set(INDEX_MD ${CMAKE_BINARY_DIR}/mmagma_index.md)
set(INDEX_HTML ${HTML_DIR}/index.html)

add_custom_command(
    OUTPUT ${INDEX_MD}
    COMMAND python3 ${CMAKE_SOURCE_DIR}/tools/make_index.py ${SRC_DIR} ${INDEX_MD}
    DEPENDS ${CHAPTERS}
    VERBATIM
)

add_custom_command(
    OUTPUT ${INDEX_HTML}
    COMMAND pandoc
        ${INDEX_MD}
        -s
        --metadata title="MMAGMA - Table des matières"
        -o ${INDEX_HTML}
    DEPENDS ${INDEX_MD}
    VERBATIM
)

list(APPEND HTML_FILES ${INDEX_HTML})

# =========================================================
# 3. TARGET HTML
# =========================================================
add_custom_target(html ALL DEPENDS ${HTML_FILES})

# =========================================================
# 4. PDF global
# =========================================================
set(PDF_FILE ${SRC_DIR}/MMAGMA-fr.pdf)

add_custom_command(
    OUTPUT ${PDF_FILE}
    COMMAND pandoc
        ${CHAPTERS}
        --pdf-engine=xelatex
        -o ${PDF_FILE}
    DEPENDS ${CHAPTERS}
    VERBATIM
)

add_custom_target(pdf ALL DEPENDS ${PDF_FILE})

# =========================================================
# 5. EPUB global
# =========================================================
set(EPUB_FILE ${SRC_DIR}/MMAGMA-fr.epub)

add_custom_command(
    OUTPUT ${EPUB_FILE}
    COMMAND pandoc
        ${CHAPTERS}
	-s
	--metadata title="MMAGMA"
        -o ${EPUB_FILE}
    DEPENDS ${CHAPTERS}
    VERBATIM
)

add_custom_target(epub ALL DEPENDS ${EPUB_FILE})

# =========================================================
# 6. Cible globale
# =========================================================
add_custom_target(makedoc DEPENDS html pdf epub)
