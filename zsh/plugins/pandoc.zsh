function md_to_pdf() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pdf" --template eisvogel --listings --pdf-engine=tectonic
}

function md_to_pdf_default() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pdf" --listings --pdf-engine=tectonic
}

function md_to_pdf_poem() {
  new_name=$(echo "$1" | cut -d '.' -f 1)
  pandoc "$1" -o "$new_name.pdf" --template poem --listings --pdf-engine=tectonic
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
