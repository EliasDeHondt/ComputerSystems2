######################
# Van Elias De Hondt #
######################

# Definiëren van de applicatiestructuur
# notities/
# │
# ├── Dockerfile
# ├── notes.txt
# └── README.md

# COPY: Het wordt hoofdzakelijk gebruikt om bestanden van de host naar de image te kopiëren. 
# Het is eenvoudig en duidelijk in zijn functionaliteit: het kopieert bestanden van de host naar de container.

# ADD: Voert dezelfde taak uit als COPY (bestanden kopiëren van de host naar de container), 
# maar heeft extra functionaliteit. Het kan ook URL's hanteren en bestanden van een URL downloaden, 
# daarnaast kan het tar-archieven automatisch uitpakken naar de doellocatie in de container.


# Gebruik de Alpine-image als basisimage
FROM alpine:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a container that prints the contents of a notes.txt file." \
      version="1.0"

# Definieer een omgevingsvariabele voor de notitiebestandslocatie
ENV NOTES_FILE_PATH=/notes/notes.txt

# Werkdirectory instellen naar /notes
WORKDIR /notes

# Kopieer het notitiebestand naar de container
ADD W8P2_Notes_TestDIY.txt $NOTES_FILE_PATH

# Voeg een entrypoint script toe
COPY W8P2_entrypoint_TestDIY.sh /notes/entrypoint.sh
RUN chmod +x /notes/entrypoint.sh

# Definieer het entrypoint script als de standaard opstartopdracht
ENTRYPOINT ["/notes/entrypoint.sh"]