cmake_minimum_required(VERSION 3.16)
project(MMAGMA)

# =========================================================
# Répertoires
# =========================================================
set (SRC_DIR ${CMAKE_SOURCE_DIR}/fr)
set(MD_DIR ${SRC_DIR}/md)
set(INDEX_MD ${CMAKE_BINARY_DIR}/mmagma_index.md)
# =========================================================
# Chapitres Markdown
# =========================================================
set (CHAPTERS
              ${MD_DIR}/introduction.md
              ${MD_DIR}/installation.md
              ${MD_DIR}/vocabulaire.md
              ${MD_DIR}/premier-fichier-mma.md
              ${MD_DIR}/utilisation-des-grooves.md
              ${MD_DIR}/format-MMA.md
              ${MD_DIR}/les-sequences.md
              ${MD_DIR}/les-riffs.md
              ${MD_DIR}/les-boucles.md
              ${MD_DIR}/les-pistes.md
              ${MD_DIR}/les-accords.md
              ${MD_DIR}/le-rythme.md
              ${MD_DIR}/les-paroles.md
              ${MD_DIR}/pistes-solo-et-melodie.md
              ${MD_DIR}/les-options-de-mma.md

              )

# =========================================================
# 1. HTML par chapitre
# =========================================================

set(HTML_DIR ${SRC_DIR}/html)
set(INDEX_MD ${CMAKE_BINARY_DIR}/mmagma_index.md)
set(INDEX_HTML ${HTML_DIR}/index.html)
file(MAKE_DIRECTORY ${HTML_DIR})
set(INDEX_HTML ${HTML_DIR}/index.html)
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
# =========================================================
#[[


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
        --toc
        -o ${INDEX_HTML}
    DEPENDS ${INDEX_MD}
    VERBATIM
)

list(APPEND HTML_FILES ${INDEX_HTML})]]

add_custom_command(
    OUTPUT ${INDEX_MD}
    COMMAND ${CMAKE_COMMAND} -E echo "# MMAGMA" > ${INDEX_MD}
    COMMAND ${CMAKE_COMMAND} -E echo "" >> ${INDEX_MD}
    COMMAND ${CMAKE_COMMAND} -E echo "## Table des matières" >> ${INDEX_MD}
    COMMAND ${CMAKE_COMMAND} -E echo "" >> ${INDEX_MD}

    # Ajout des chapitres
    ${CMAKE_COMMAND} -E echo_append ""  # hack pour éviter erreur syntaxe

    VERBATIM
)
foreach(CHAP ${CHAPTERS})
    get_filename_component(NAME ${CHAP} NAME_WE)

    # Capitalisation simple (optionnelle)
    string(REPLACE "-" " " TITLE ${NAME})

    add_custom_command(
        OUTPUT ${INDEX_MD}
        APPEND
        COMMAND ${CMAKE_COMMAND} -E echo "- [${TITLE}](${NAME}.html)" >> ${INDEX_MD}
    )
endforeach()

# Conversion en HTML
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


set(PDF_FILE ${SRC_DIR}/pdf/MMAGMA-fr.pdf)
set(TEX_DIR  ${SRC_DIR}/tex)
set(TEXTEMPLATESDIR ${TEX_DIR}/templates/)
set(HEADER_TEX ${TEXTEMPLATESDIR}/header.tex)
set(TITLEPAGE_TEX ${TEXTEMPLATESDIR}/titlepage.tex)
set(COVER_TEX ${TEXTEMPLATESDIR}/cover.tex)
set(PREAMBLE_TEX ${TEXTEMPLATESDIR}/preamble.tex)

add_custom_command(
    OUTPUT ${TEXTEMPLATESDIR}
    COMMAND pandoc -D latex > ${TEMPLATESDIR}
    COMMAND sed -i "s/\\\\usepackage{lmodern}/%% lmodern removed/" ${TEMPLATESDIR}
    VERBATIM
)

#add_custom_target(template DEPENDS ${TEMPLATESDIR})

add_custom_command(
   OUTPUT ${PDF_FILE}
    COMMAND pandoc
        ${CHAPTERS}
        --pdf-engine=xelatex
        --template=${TEXTTEMPLATESDIR}/default.latex
        --number-sections
        --toc
        -V documentclass=book
        -V lang=fr
        -V classoption=openright
        -H ${HEADER_TEX}
        --include-before-body=${TITLEPAGE_TEX}
        -o ${PDF_FILE}
    DEPENDS ${CHAPTERS} ${TEMPLATE} ${TITLEPAGE}
    VERBATIM
)

add_custom_target(pdf DEPENDS ${PDF_FILE})


# =========================================================
# 5. EPUB global
# =========================================================
set(EPUB_FILE ${SRC_DIR}/epub/MMAGMA-fr.epub)
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
