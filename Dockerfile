# Utiliser une image Python officielle
FROM python:3.11-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier requirements et installer les dépendances
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copier le reste du projet
COPY . .

# Collecter les fichiers statiques
RUN python manage.py collectstatic --noinput

# Exposer le port 8001
EXPOSE 8001

# Commande pour démarrer l'app
CMD ["gunicorn", "nom_du_projet.wsgi:application", "--bind", "0.0.0.0:8001"]
