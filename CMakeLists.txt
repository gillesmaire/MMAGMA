cmake_minimum_required(VERSION 3.10)
project(MMA_BOOK)

set(SOURCES
    fr/chapitre-01-introduction.md
    fr/table-des-matieres.md
    fr/chapitre-02-installation.md
    fr/chapitre-03-premier-fichier-mma.md
    fr/chapitre-04-Les-accords.md
    fr/chapitre-05-Le-rythme.md
    fr/chapitre-06-Les-pistes.md
)

add_custom_target(makedoc ALL
    COMMAND pandoc
        ${SOURCES}
        -o fr.pdf
        --pdf-engine=xelatex
        --toc
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)
