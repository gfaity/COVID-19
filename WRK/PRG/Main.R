#Germain FAITY - 2020
#EuroMov - Universite de Montpellier

#ToSave difference between groups

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

#######################################################################################################################
# Arrange dataframe
oldD = D
D = D[which(D$sexe==0),]
D$sexe = NULL
D$hosp = NULL
D$rad = NULL
D$dc = NULL

#from long to wide
D <- reshape(D, v.names = "rea", idvar = "jour",
                timevar = "dep", direction = "wide")

#Get name
rownames(D) <- D$jour
jour = D$jour
D$jour = NULL

#delete last column (error)
D = D[,-ncol(D)]

#Get sum of columns
NbRea <- rowSums(D)

#Prepare for export in PNG
png(file=file.path(RES_DIR,"NbRea.png"),
    width=600, height=350)

#plot
plot(NbRea, xaxt = "n")
axis(1, at=c(0,50,100,150), labels=c(as.Date(jour[1]),as.Date(jour[51]),as.Date(jour[101]),as.Date(jour[151])))

#export image in PNG
dev.off()
