#! sh

# Busco los filenames en SUMMARY.md y concateno a todo.md
cat `egrep '\./.*\.md' -o SUMMARY.md` >> FLAT.md

# Usando pandoc
pandoc FLAT.md -o processed.tex
pandoc -r markdown-auto_identifiers --listings -w latex FLAT.md -o processed.tex
