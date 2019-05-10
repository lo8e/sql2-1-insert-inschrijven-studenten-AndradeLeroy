# Studenten ingeschreven voor 1-1-2017 dienen inactief gezet te worden.
#* -> Wijzig dit d.m.v een UPDATE statement.UPDATE studenten 
SET actief = "0" WHERE inschrijvings_datum <= "2017-1-1";