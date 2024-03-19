#!/bin/bash

# Vérifie si un argument a été fourni
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_flutter_project_directory>"
    exit 1
fi

# Utilise l'argument fourni comme chemin vers le répertoire racine du projet Flutter
PROJECT_DIR=$1

echo "Convertis les fins de ligne de Windows (CRLF) à Linux (LF) pour tout le projet..."
find "$PROJECT_DIR" -type f \( -name "*.dart" -o -name "*.yaml" -o -name "*.sh" -o -name "*.md" \) -exec dos2unix {} \;

echo "Construction du projet Flutter pour Linux..."
cd "$PROJECT_DIR" || exit
flutter config --enable-linux-desktop
flutter doctor
flutter build linux

echo "Reconvertit les fins de ligne de Linux (LF) à Windows (CRLF) pour tout le projet..."
find "$PROJECT_DIR" -type f \( -name "*.dart" -o -name "*.yaml" -o -name "*.sh" -o -name "*.md" \) -exec unix2dos {} \;

echo "Opération terminée."

