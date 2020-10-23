# COVID-19
# Author : Germain Faity - germain.faity@umontpellier.fr

############FRANCAIS############

# DESCRIPTION
Affiche quelques données du COVID-19
"WRK/RES/NbHosp.png" est le nombre de patient hospitalise en France jour par jour
"WRK/RES/NbRea.png" est le nombre de patient en reanimation en France jour par jour
"WRK/RES/NbRad.png" est le nombre de patient retourne a domicile en France (cumul)
"WRK/RES/NbDC.png" est le nombre de patient decede en France (cumul)

# SOURCE DES DONNEES
https://www.data.gouv.fr/fr/datasets/r/63352e38-d353-4b54-bfd1-f1b3ee1cabd7
https://www.data.gouv.fr/fr/datasets/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19/

# INFRASTRUCTURE
Le repertoire DAT contient les jeux de donnees
le repertoire PRG contient les fichiers de code
Le fichier "Main.R" est le code source
Le repertoire RES contient les resultats (graphiques)

# COMMENT UTILISER
Ouvrir et sourcer "/WRK/PRG/Main.R" avec R 3.6.1+
Selectionner le jeux de donnees a analyser
Le graphique s exporte dans le repertoire "WRK/RES"

# METADONNEES
Sexe
	0 = femmes + hommes
	1 = hommes
	2 = femmes
jour = Date de notification
hosp = Nombre de personnes actuellement hospitalisées
rea = Nombre de personnes actuellement en réanimation ou soins intensifs
rad = Nombre cumulé de personnes retournées à domicile
dc = Nombre cumulé de personnes décédées


############ENGLISH############

# DESCRIPTION
Plotting some data from COVID-19
"WRK/RES/NbHosp.png" is number of patients hospitalized in France day by day
"WRK/RES/NbRea.png" is number of patients in reanimation in France day by day
"WRK/RES/NbRad.png" is number of patients returned home in France (total)
"WRK/RES/NbDC.png" is number of deaths in France (total)

# DATA SOURCE
https://www.data.gouv.fr/fr/datasets/r/63352e38-d353-4b54-bfd1-f1b3ee1cabd7
https://www.data.gouv.fr/fr/datasets/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19/

# INFRASTRUCTURE
DAT folder is directory of data files
PRG folder is directory of coding files
"Main.R" is source code
RES folder is directory of exporting results (plot)

# HOW TO USE
Open and source "/WRK/PRG/Main.R" with R 3.6.1+
Select data file to analyse
Graphic plot is exporting in "WRK/RES"

# METADATA
Sexe
	0 = females + males
	1 = males
	2 = females
jour = date of notice
hosp = Number of people currently hospitalized
rea = Number of people currently in resuscitation or critical care
rad = Total amount of patient that returned home
dc = Total amout of deaths

# SEE ALSO
France : https://www.francetvinfo.fr/sante/maladie/coronavirus/infographies-covid-19-morts-hospitalisations-age-malades-l-evolution-de-l-epidemie-en-france-et-dans-le-monde-en-cartes-et-graphiques.html
Worldwide : https://gisanddata.maps.arcgis.com/apps/opsdashboard/index.html?fbclid=IwAR0191UQgOgutZCVbML51s9chjkUM_JKbQPVOjVEVC8n6mnEO_epIJDve-4#/bda7594740fd40299423467b48e9ecf6