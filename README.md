# Projet Airbnb Analytics

Ce dépôt contient un pipeline d'analyse pour des données Airbnb, construit avec dbt et accompagné d'une application de visualisation Streamlit. L'objectif est d'ingérer les données brutes, de construire des couches de transformation (bronze → silver → gold) et d'offrir des analyses exploratoires et des résumés exploitables.

## Contenu
- `data/` : fichiers de données et base DuckDB utilisée pour les tests et l'exploration.
- `dbt_project/` : projet dbt avec modèles organisés en `bronze`, `silver` et `gold`.
- `streamlit_app/` : application Streamlit pour visualiser les résultats (`app.py`).

## Structure des données
- `data/raw/` : exports CSV initiaux (`hosts.csv`, `listings.csv`, `reviews.csv`, ...).
- `data/bronze`, `data/silver`, `data/gold` : emplacements attendus pour les tables transformées (selon workflow dbt).
- `data/airbnb.duckdb` : fichier DuckDB utilisé localement pour stocker les données et servir d'adaptateur dbt.

## Pré-requis
- Python 3.10+ recommandé
- dbt (avec l'adaptateur DuckDB si vous utilisez DuckDB)
- DuckDB, Streamlit et bibliothèques usuelles (`pandas`, etc.)

Exemple d'installation rapide (venv) :

```bash
python -m venv .venv
source .venv/bin/activate   # ou `.venv\\Scripts\\Activate.ps1` sur Windows PowerShell
pip install --upgrade pip
pip install dbt-core dbt-duckdb duckdb pandas streamlit
```

## Commandes utiles
- Initialiser et exécuter dbt :

```bash
cd dbt_project
# installer les dépendances dbt si nécessaire
dbt deps
# charger les fichiers seed (s'il y en a)
dbt seed
# exécuter les modèles
dbt run
# lancer les tests
dbt test
```

- Lancer l'application Streamlit :

```bash
streamlit run streamlit_app/app.py
```

- Ouvrir la base DuckDB en local :

```bash
duckdb data/airbnb.duckdb
.tables
```

## Objectifs et analyses
- Construire des indicateurs d'activité des hôtes et des annonces.
- Analyser l'impact de phénomènes temporels (ex. pleine lune) sur les réservations et les avis (exemple de modèle `gold_full_moon_impact.sql`).
- Produire des résumés par hôte, annonce et revue pour alimenter des tableaux de bord.

## Où regarder dans le code
- Modèles dbt : [dbt_project/models/](dbt_project/models)
- Application de visualisation : [streamlit_app/app.py](streamlit_app/app.py)

## Contribution
Ouvrez une issue pour proposer des améliorations ou créer une pull request avec une description claire des changements.

## Licence & Contact
Ce projet est partagé à titre pédagogique. Pour toute question, contactez l'auteur via le dépôt.

