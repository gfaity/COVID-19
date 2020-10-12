#Plot reanimations in dpt over time

plotRea <- function(D, Dpt, scale, Hab){
  
  if(missing(Hab)) {Hab = 1}
  
  #Results in part per 100 000 habitants
  if(is_empty(scale)){
    Hab = 1
  } else {
    Hab = Hab/100000
  }
  
  #Prepare for export in PNG
  if(is_empty(scale)){
    Prct = "per1_"
  } else {
    Prct = "per100000_"
  }
  png(file=file.path(RES_DIR,paste(Prct,Dpt,"_NbRea.png", sep =""), sep=""),
      width=600, height=350)
  
  #plot
  if (is_empty(scale)) {
    plot(D$rea/Hab, xaxt = "n", xlab = "Date", ylab = paste("Number of persons in reanimation in",Dpt), ylim = NULL)
  } else {
    plot(D$rea/Hab, xaxt = "n", xlab = "Date", ylab = "", ylim = scale)
    title(ylab=paste("Number of persons in reanimation in ",Dpt,"\n(Persons per 100 000 inhabitants)", sep=""), line=2)
  }
  axis(1, at=c(0,50,100,150), labels=c(as.Date(D$jour[1]),as.Date(D$jour[51]),as.Date(D$jour[101]),as.Date(D$jour[151])))
  
  #export image in PNG
  dev.off()
}