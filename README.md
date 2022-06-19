# 20718284-Data-Science-Exam
2022 exam submission
## Getting started
'''
devtools::install_github("Nicktz/fmxdat", force = TRUE)
CHOSEN_LOCATION <- "/Users/joshuastrydom/Desktop/ECONOMICS POSTGRADUATE/Masters/Data Science/20718284-Data-Science-Exam/"
fmxdat::make_project("/Users/joshuastrydom/Desktop/ECONOMICS POSTGRADUATE/Masters/Data Science/20718284-Data-Science-Exam/", Mac = TRUE)
fmxdat::make_project(FilePath = glue::glue("{CHOSEN_LOCATION}Solution/"), 
                     ProjNam = "20718284", Open = T)

Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question1")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question2")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question3")
Texevier::create_template(directory = glue::glue("{CHOSEN_LOCATION}Solution/20718284/"), template_name = "Question4")
'''
