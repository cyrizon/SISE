#1
setwd("./CSV Database")

#2
print(list.files(pattern="*.csv"))

#3
library(tidyverse)

#4
clients = readr::read_delim("Clients.csv",delim=";")

#5
print(class(clients))

#6
print(str(clients))

#7
print(clients)

#8
print(clients, n = 91)

#9
print(clients)

#10
library(sqldf)

#11
print(clients[c("Societe","Contact","Fonction","Ville","Pays")])

print(clients %>%
        dplyr::select("Societe","Contact","Fonction","Ville","Pays"))

sql <- "select Societe, Contact, Fonction, Ville, Pays from clients"
dfSql <- sqldf(sql)
print(class(dfSql))
print(head(dfSql,10))

#12
colClients <- c("Societe","Contact","Fonction","Ville","Pays")
print(clients[clients$Pays == "France", colClients])

print(clients %>%
        dplyr::select("Societe","Contact","Fonction","Ville","Pays") %>%
        dplyr::filter(Pays == "France"))

sql <- "SELECT Societe, Contact, Fonction, Ville, Pays
        FROM clients
        WHERE Pays == 'France'"
dfSql <- sqldf(sql)
print(dfSql)

#13
colClients <- c("Societe","Contact","Fonction","Ville","Pays")
print(clients[clients$Pays == "France" & clients$Fonction == "Propriétaire", colClients])

print(clients %>%
        dplyr::select("Societe","Contact","Fonction","Ville","Pays") %>%
        dplyr::filter(Pays == "France" & Fonction == "Propriétaire"))

sql <- "SELECT Societe, Contact, Fonction, Ville, Pays
        FROM clients
        WHERE Pays == 'France' AND Fonction == 'Propriétaire'"
dfSql <- sqldf(sql)
print(dfSql)

#14
colPays <- c("Pays")
print(table(clients[colPays]))

print(clients %>%
        dplyr::select("Pays") %>%
        dplyr::group_by(Pays) %>%
        dplyr::summarise(count = n()))

sql <- "SELECT COUNT(Pays), Pays
        FROM clients
        GROUP BY Pays"
dfSql <- sqldf(sql)
print(dfSql)

#15
colPays <- c("Ville","Pays")
print(table(clients[clients$Pays == "France", colPays]))

print(clients %>%
        dplyr::select("Ville","Pays") %>%
        dplyr::filter(Pays == "France") %>%
        dplyr::group_by(Ville) %>%
        dplyr::summarise(count = n()))

sql <- "SELECT Ville, COUNT(Ville)
        FROM clients
        WHERE Pays == 'France'
        GROUP By Ville"
dfSql <- sqldf(sql)
print(dfSql)

#16
commandes <- readr::read_delim("Commandes.csv",delim=";")
print(class(commandes))
print(str(commandes))

#17
col_Commandes <- c("Date_commande","Num_employe","Destinataire","Pays_livraison")
liste_commandes <- merge(commandes,clients, by = "Code_client")
print(liste_commandes[liste_commandes$Societe =="Lehmanns Marktstand", col_Commandes])

print(dplyr::left_join(clients,commandes, by = "Code_client") %>%
      dplyr::filter(Societe == "Lehmanns Marktstand") %>%
      dplyr::select("Date_commande","Num_employe","Destinataire","Pays_livraison"))

sql <- "SELECT Date_commande, Num_employe, Destinataire, Pays_livraison
        FROM clients
        LEFT JOIN commandes
        ON clients.Code_client == commandes.Code_client
        WHERE Societe == 'Lehmanns Marktstand'"
dfSql <- sqldf(sql)
print(dfSql)

#18
col_Commandes <- c("Contact")
liste_commandes <- merge(clients, commandes, by = "Code_client")
print(table(liste_commandes[col_Commandes]))

print(dplyr::inner_join(clients,commandes,by = "Code_client") %>%
      dplyr::group_by(Contact) %>%
      dplyr::summarise(count = n()))

sql <- "SELECT Contact, count(Contact)
        FROM clients
        INNER JOIN commandes
        on  clients.Code_client = commandes.Code_client
        GROUP BY Contact"
dfSql <- sqldf(sql)
print(dfSql)

#19
col_Commandes <- c("Societe")
liste_commandes <- merge(clients, commandes , by = "Code_client", all.x = TRUE)
print(subset(liste_commandes, is.na(liste_commandes$Pays_livraison))[col_Commandes])

print(clients %>%
      dplyr::anti_join(commandes,by = "Code_client") %>%
      dplyr::select(Societe))

sql <- "SELECT Societe
        FROM clients
        LEFT JOIN commandes
        on  clients.Code_client = commandes.Code_client
        WHERE commandes.Code_client IS NULL"
dfSql <- sqldf(sql)
print(dfSql)

#20
employes <- readr::read_delim("Employes.csv",delim=";")
print(class(employes))
print(str(employes))

#21
sql <- "SELECT Nom, Prenom, Fonction
        FROM employes
        WHERE Rend_compte_a IS NULL"
dfSql <- sqldf(sql)
print(dfSql)

#22
col_employes <- c("Nom", "Prenom")
liste_employes <- merge(employes, commandes, by = "Num_employe")
print(table(liste_employes[liste_employes$Destinataire =="Lehmanns Marktstand", col_employes]))

print(employes %>%
      dplyr::left_join(commandes, by = "Num_employe") %>%
      dplyr::filter(Destinataire == "Lehmanns Marktstand") %>%
      dplyr::group_by(Nom, Prenom) %>%
      dplyr::summarise(count = n()))

sql <- "SELECT Nom, Prenom, COUNT(employes.Num_employe)
        FROM employes
        LEFT JOIN commandes
        ON employes.Num_employe = commandes.Num_employe
        WHERE Destinataire == 'Lehmanns Marktstand'
        GROUP BY employes.Num_employe"
dfSql <- sqldf(sql)
print(dfSql)

#23
details_commandes <- readr::read_delim("Details_commandes.csv",delim=";")
print(class(details_commandes))
print(str(details_commandes))

details_commandes["Montant"] <- (details_commandes$Prix_unitaire * details_commandes$Quantite) * (1 - details_commandes$Remise)
print(details_commandes)

#24