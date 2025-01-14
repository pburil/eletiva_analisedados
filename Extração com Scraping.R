# arquivos html

library(rvest)
library(dplyr)

# presidentes do Brasil

url <- "https://pt.wikipedia.org/wiki/Lista_de_presidentes_do_Brasil"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

presidentesBrasil <- as.data.frame(html_table(urlTables[1], header = TRUE, fill = TRUE)) %>%
  select(N., Presidente, periodo_e_dura��o = Per�odo.do.mandato.dura��o.do.mandato., Partido, vice_presidente = Vice.presidente.s., Elei��o) 
  
presidentesBrasil <- presidentesBrasil[-c(1), ]

