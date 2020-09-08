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

###

#correct bug in data
D$jour[which(D$jour=="27/06/2020")] <- "2020-06-27"
D$jour[which(D$jour=="28/06/2020")] <- "2020-06-28"
D$jour[which(D$jour=="29/06/2020")] <- "2020-06-29"


#######################################################################################################################
# Arrange dataframe
D = D[which(D$sexe==0),]              #delete sexes
D$dep = as.factor(D$dep)              
D = aggregate(. ~ jour, D, sum)       #delete departments


####################
#hospitalisation
####################

#Prepare for export in PNG
png(file=file.path(RES_DIR,"NbHosp.png"),
    width=600, height=350)

#plot
plot(D$hosp, xaxt = "n", xlab = "Date", ylab = "Number of person hospitalised in France")
axis(1, at=c(0,50,100,150), labels=c(as.Date(D$jour[1]),as.Date(D$jour[51]),as.Date(D$jour[101]),as.Date(D$jour[151])))

#export image in PNG
dev.off()


####################
#reanimation
####################

#Prepare for export in PNG
png(file=file.path(RES_DIR,"NbRea.png"),
    width=600, height=350)

#plot
plot(D$rea, xaxt = "n", xlab = "Date", ylab = "Number of person in reanimation in France")
axis(1, at=c(0,50,100,150), labels=c(as.Date(D$jour[1]),as.Date(D$jour[51]),as.Date(D$jour[101]),as.Date(D$jour[151])))

#export image in PNG
dev.off()


####################
#return home #retour a domicile
####################

#Prepare for export in PNG
png(file=file.path(RES_DIR,"NbRad.png"),
    width=600, height=350)

#plot
plot(D$rad, xaxt = "n", xlab = "Date", ylab = "Number of person returned home in France")
axis(1, at=c(0,50,100,150), labels=c(as.Date(D$jour[1]),as.Date(D$jour[51]),as.Date(D$jour[101]),as.Date(D$jour[151])))

#export image in PNG
dev.off()

####################
#return home #retour a domicile
####################

#Prepare for export in PNG
png(file=file.path(RES_DIR,"NbRad.png"),
    width=600, height=350)

#plot
plot(D$rad, xaxt = "n", xlab = "Date", ylab = "Number of person returned home in France")
axis(1, at=c(0,50,100,150), labels=c(as.Date(D$jour[1]),as.Date(D$jour[51]),as.Date(D$jour[101]),as.Date(D$jour[151])))

#export image in PNG
dev.off()


####################
#deaths #deces
####################

#Prepare for export in PNG
png(file=file.path(RES_DIR,"NbDC.png"),
    width=600, height=350)

#plot
plot(D$dc, xaxt = "n", xlab = "Date", ylab = "Number of deaths in France")
axis(1, at=c(0,50,100,150), labels=c(as.Date(D$jour[1]),as.Date(D$jour[51]),as.Date(D$jour[101]),as.Date(D$jour[151])))

#export image in PNG
dev.off()


