#This function aims to set some initialisation
#load some usefull packages
#clear variables
#set directories of interest
#source local functions of interest
#######################################################################################################################
# # if necessary (initialisation in case of debugging)
# if ("ReachStroke"%in%installed.packages()) {
#   remove.packages("ReachStroke")
# }


# if install.load package is not installed locally, download,install and launch
if (!"install.load"%in%installed.packages()) {
  install.packages("install.load")
}

#launch some usefull packages
library(install.load)
install_load(RequiredPackages)

#######################################################################################################################
#Initialisation
rm(list=ls())                   #remove all objects
cat(rep("\n", 100))             #clean the console by printing white lines in console
closeAllConnections()           #clear connections
while (dev.cur()>1) dev.off()   #clear plots
#while (rgl.cur()) rgl.close()  #clear rgl (no need here)
cat("\n\n########################## BEG OF PRG ##########################\n\n")

# -- Organize you workspace on the hard disk
# -- The directory structure is :
# - WRK
#    - PRG = all program files (.sce and .sci)
#    - DAT = all input data
#    - RES = all results of procesing here
# NOTE : subdirectory are possible, and certainly useful if many files...

# define the directory structure
# this.dir <- dirname(parent.frame(2)$ofile)        # directory of this PRG R file
# this.dir <- getSrcDirectory()[1]
# this.dir <- dirname(sys.frame(1)$ofile)
this.dir<- dirname(rstudioapi::getActiveDocumentContext()$path)

setwd(this.dir)                                   # select this directory
PRG_DIR = getwd()                                 # stock the current directory in PRG_DIR
FCT_DIR = file.path(PRG_DIR,"FCT")                # stock the function directory
COD_DIR = file.path(PRG_DIR,"COD")                # stock the code directory
setwd("../DAT")                                   # ascend (..) then descend in DAT
DAT_DIR = getwd()                                 # stock current directory in DAT_DIR
setwd("../RES")                                   # ascend (..) then descend in RES
RES_DIR = getwd()                                 # stock current directory in RES_DIR

setwd(PRG_DIR)                                    # select PRG_DIR as current directroy
cat(paste("Working directory is : ", getwd(), "\n"))  # disp current directory in console

#######################################################################################################################
#find functions to source in PRG folder
files <- list.files(FCT_DIR, pattern = "\\.R$")

#source these functions
for (ifunction in 1:length(files)){
  #Construct full file name
  function2read = files[ifunction]
  
  if (function2read != "Init.R") {
    function2readFname = file.path(FCT_DIR,function2read)
    
    #source
    source(function2readFname)
  }
}