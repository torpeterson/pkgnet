# library(pkgnet)
# result <- CreatePackageReport("dplyr")
# result$set_package()


RenderReport <- function(packageToReport
                         , outputFolder = "."
                         , outputFileName = "pkgnetReport.html"
                         , quietRenderFlag = TRUE) {
  # pkgnetReportPath <- system.file('report_template', package = 'pkgnet')
  # pkgnetReportRMD <- file.path(pkgnetReportPath, "report_template.Rmd")
  pkgnetReportRMD <- file.path("~/pkgnet/inst/report_template/report_template.Rmd")
  
  rmarkdown::render(pkgnetReportRMD 
                    , output_format = rmarkdown::html_document()
                    , output_dir = outputFolder
                    , output_file = outputFileName
                    , quiet = quietRenderFlag # Shut it up by default so it doesn't appear in the log
                    , envir = new.env() # Make sure we have a clean environment where the doc can only access things we pass in explicity to the Rmd
                    , params = list(
                      packageToReport = packageToReport
                      , clean = TRUE # TRUE to clean intermediate files created during rendering
                    )
  )
}

RenderReport(packageToReport = "dplyr")
