#! sh

# Busco los filenames en SUMMARY.md y concateno a FLAT.md
cat `egrep '\./.*\.md' -o SUMMARY.md` >> FLAT.md

# Usando pandoc
# -r markdown-auto_identifiers es para que no ponga hyperlinks en títulos
# --listings es para que use listings en vez de verbatim
pandoc -r markdown-auto_identifiers --listings -w latex FLAT.md -o processed.tex
