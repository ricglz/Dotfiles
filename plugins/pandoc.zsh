function md_to_pdf() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pdf" --template eisvogel --listings --pdf-engine=tectonic
}

function md_to_pdf_cited() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pdf" --template eisvogel_apa --listings \
              --pdf-engine=tectonic --filter pandoc-fignos pandoc-citeproc
}

function md_to_word() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.docx" --reference-doc="$HOME/.pandoc/templates/default.docx"
}

function md_to_pptx() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pptx"
}

function md_to_pptx_cited() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pptx" --filter pandoc-citeproc
}
