#Germain FAITY - 2020
#EuroMov - Universite de Montpellier

#######################################################################################################################
#Execute initialisation of this programm
#   Clear variable
#   Set directories
#   Load functions

#Which packages need to be installed/loaded ?
RequiredPackages = c('rJava',
                     'rChoiceDialogs',
                     'tidyverse')

#Get directory of where are store others parts of programm (.R files)
PRG_DIR<- dirname(rstudioapi::getActiveDocumentContext()$path) # stock the current directory in PRG_DIR
# this.dir<- dirname(rstudioapi::getActiveDocumentContext()$path)
# setwd(this.dir)                                   # select this directory
# PRG_DIR = getwd()                                 # stock the current directory in PRG_DIR

#Run other part of programm : initialisation part
function2readFname = file.path(PRG_DIR,"FCT", "Init.R") #Construct function full name
source(function2readFname)                              #source

#######################################################################################################################
# OPENING A FILE
# by clicking on data
setwd(DAT_DIR)                                        # select DAT_DIR as current directroy
#fnameData = file.choose()                            # old solution: it pop behind and not pop up
fnameData = jchoose.files()
setwd(PRG_DIR)                                        # select PRG_DIR as current directroy

# Read data
D = read.csv(fnameData, sep = ";")                    # file reading
cat(paste("Data imported from : ", fnameData, "\n"))  # inform user

###

#correct bug in data
D$jour[which(D$jour=="27/06/2020")] <- "2020-06-27"
D$jour[which(D$jour=="28/06/2020")] <- "2020-06-28"
D$jour[which(D$jour=="29/06/2020")] <- "2020-06-29"

# Arrange dataframe
D = D[which(D$sexe==0),]            #delete sexes
D$dep = as.factor(D$dep)              
Dfull = D                            #save for later use

#######################################################################################################################
#Ask for scale
# TRUE = results exprimed in person per 100 000 of population of department
# FALSE = scale is department specific
#InPrct = TRUE #FALSE
#######################################################################################################################

#Begin plots
# For each department, ask to run analysis in

#France
Dpt = "France"
nDpt = 0
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE) #if (missing (SameScale)) {SameScale=FALSE}
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)

#Herault
Dpt = "Herault"
nDpt = 34
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)

#Charente
Dpt = "Charente"
nDpt = 16
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)

#Vaucluse
Dpt = "Vaucluse"
nDpt = 84
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)

#Bouche du rhone
Dpt = "Bouche du Rhone"
nDpt = 13
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)

#Bouche du rhone
Dpt = "Gard"
nDpt = 30
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)

#Find the department with max rea (worse department)
nDpt = Dfull$dep[which(Dfull$rea==max(Dfull$rea))]
Dpt = as.character(nDpt)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = TRUE)
RunAnalysis(Dfull, Dpt, nDpt, InPrct = FALSE)
