#!/bin/bash

# (EST) Deklareerin muutujad.
# (ENG) Declaring variables.

tanane_kuupaev=$(date +%Y-%m-%d)

# (EST) Arhiivi asukoht ja nimi. Saab muuta, kui on soov arhiiv kuhu mujale salvestada.
# (ENG) Archive location and name. Can be changed if you want to save the archive elsewhere.
arhiiv_asukoht="./arhiiv/arhiiv-${tanane_kuupaev}"

arhiiv_nimi="arhiiv_${tanane_kuupaev}_$(date +%H-%M-%S).tar.gz"

# (EST) Tekitan kausta arhiiv, kui seda veel olemas pole.
# (ENG) Creating a folder for the archive, if it doesn't exist yet.
mkdir -p "$arhiiv_asukoht"

# (EST) Arhiveerin failid (jätan välja failid, mis on tehtud tänase kuupäeva jooksul ja CLEAN.sh faili).
# (ENG) Archiving files (excluding files created during the current date, the CLEAN.sh file and the arhiiv folder itself).
find . -maxdepth 1 ! -name "CLEAN.sh" ! -name "arhiiv" ! -newermt "$tanane_kuupaev 00:00:00" -exec tar -czf "$arhiiv_asukoht/$arhiiv_nimi" {} +

# (EST) Eemaldan failid, mis arhiveeriti.
# (ENG) Removing files that were archived.
find . -maxdepth 1 ! -name "CLEAN.sh" ! -newermt "$tanane_kuupaev 00:00:00" -exec rm {} +

echo "Arhiveerimine lõpetatud."
