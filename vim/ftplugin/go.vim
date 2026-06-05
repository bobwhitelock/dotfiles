
let b:lumberjack_print_string = 'fmt.Printf("IDENTIFIER: %+v\n", VALUE)'

autocmd BufWritePre <buffer> LspDocumentFormatSync
