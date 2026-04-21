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
set (CHAPTERS ${SRC_DIR}/introduction.md
              ${SRC_DIR}/installation.md
              ${SRC_DIR}/vocabulaire.md
              ${SRC_DIR}/premier-fichier-mma.md
              ${SRC_DIR}/les-sequences.md
              ${SRC_DIR}/utilisation-des-grooves.md
              ${SRC_DIR}/les-riffs.md
              ${SRC_DIR}/les-boucles.md
              ${SRC_DIR}/les-pistes.md
              ${SRC_DIR}/les-accords.md
              ${SRC_DIR}/le-rythme.md
              ${SRC_DIR}/les-options-de-mma.md
              )

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
        --number-sections
        --toc
	-M title=MMAGMA 
        -M author=Gilles\ Maire
        -M date=2026
   	    -V documentclass=book
   	    -V lang=fr
        -V classoption=openright
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
