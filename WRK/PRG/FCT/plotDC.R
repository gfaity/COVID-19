#Plot deaths in dpt over time

plotDC <- function(D, Dpt, scale, Hab){
  
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
  png(file=file.path(RES_DIR,paste(Prct,Dpt,"_NbDC.png", sep =""), sep=""),
      width=900, height=525, res=90)
  
  #plot
  if (is_empty(scale)) {
    plot(D$dc/Hab, xaxt = "n", xlab = "Date", ylab = paste("Number of deaths in",Dpt), ylim = NULL)
  } else {
    plot(D$dc/Hab, xaxt = "n", xlab = "Date", ylab = "", ylim = scale)
    title(ylab=paste("Number of deaths in ",Dpt,"\n(Persons per 100 000 inhabitants)", sep=""), line=2)
  }
  par(las=2) #make axis label perpendicular to the axis
  axis(1, cex.axis=0.7, at=c(0,55,100,150,200,213,225,273,length(D$jour)), labels=c(as.character(paste(D$jour[1],"\nConfinement1")),as.character(paste(D$jour[56],"\nDeconfinement1")),as.character(D$jour[101]),as.character(D$jour[151]),as.character(D$jour[201]),as.character(paste(D$jour[214],"\nCouvre-feu")),as.character(paste(D$jour[226],"\nConfinement2")),as.character(paste(D$jour[273],"\nDéconfinement2")),as.character(D$jour[length(D$jour)])))
  
  #export image in PNG
  dev.off()
}