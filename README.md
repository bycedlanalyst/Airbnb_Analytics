# 🏠 Airbnb Analytics Platform

## C'est quoi ce projet ?

Ce projet analyse les données Airbnb de Berlin pour aider à mieux comprendre :
- Les logements disponibles et leurs prix
- Les hôtes et leur performance
- Les avis des voyageurs
- L'impact des nuits de pleine lune sur les avis

On a construit une vraie plateforme de données professionnelle, comme celles utilisées en entreprise, avec des outils modernes.

---

## 🛠️ Les outils utilisés

| Outil | Rôle |
|-------|------|
| **DuckDB** | La base de données qui stocke et analyse nos données |
| **dbt** | L'outil qui transforme et nettoie les données |
| **Streamlit** | L'outil qui affiche le dashboard interactif |
| **Git/GitHub** | Pour sauvegarder et partager le code |

---

## 📁 Structure du projet

```
Projet_Airbnb_Analytics/
│
├── data/                        → Les données (non versionnées sur GitHub)
│   ├── raw/                     → Données brutes originales
│   ├── bronze/                  → Données ingérées
│   ├── silver/                  → Données nettoyées
│   └── gold/                    → Données prêtes pour l'analyse
│
├── dbt_project/                 → Tout le code de transformation des données
│   ├── models/
│   │   ├── bronze/              → Chargement des données brutes
│   │   ├── silver/              → Nettoyage et typage des données
│   │   └── gold/                → Indicateurs métier finaux
│   ├── models/schema.yml        → Tests de qualité des données
│   └── dbt_project.yml          → Configuration dbt
│
├── streamlit_app/
│   └── app.py                   → Le dashboard interactif
│
├── .gitignore                   → Fichiers exclus de GitHub
└── README.md                    → Ce fichier
```

---

## 🏗️ L'architecture des données

Les données passent par 3 couches successives, comme un entonnoir :

```
📂 Fichiers CSV (données brutes)
        ↓
🥉 Couche Bronze  →  On charge les données telles quelles
        ↓
🥈 Couche Silver  →  On nettoie et on corrige les types
        ↓
🥇 Couche Gold    →  On calcule les indicateurs finaux
        ↓
📊 Dashboard Streamlit  →  On visualise les résultats
```

---

## 📊 Les données utilisées

| Fichier | Contenu |
|---------|---------|
| `listings.csv` | Les logements Airbnb (prix, type, hôte...) |
| `hosts.csv` | Les hôtes (nom, superhost ou non...) |
| `reviews.csv` | Les avis des voyageurs (sentiment, date...) |
| `seed_full_moon_dates.csv` | Les dates de pleine lune |

---

## ⚙️ Installation et lancement

### 1. Cloner le projet
```bash
git clone https://github.com/bycedlanalyst/Airbnb_Analytics.git
cd Airbnb_Analytics
```

### 2. Installer les dépendances
```bash
pip install duckdb dbt-duckdb streamlit plotly
```

### 3. Ajouter les données
Place les 4 fichiers CSV dans le dossier `data/raw/`

### 4. Lancer les transformations dbt
```bash
cd dbt_project
dbt run
dbt test
```

### 5. Lancer le dashboard
```bash
cd ../streamlit_app
streamlit run app.py
```

### 6. Ouvrir le dashboard
Va sur [http://localhost:8501](http://localhost:8501) dans ton navigateur.

---

## 📈 Les indicateurs disponibles

### 🏠 Listings
- Nombre de logements par type
- Prix moyen, minimum et maximum par type
- Durée minimum de séjour moyenne

### 👤 Hôtes
- Classement des hôtes par nombre de logements
- Prix pratiqués par hôte
- Distinction superhost / hôte classique

### ⭐ Avis
- Répartition des sentiments (positif, neutre, négatif)
- Pourcentage de chaque sentiment

### 🌕 Impact Pleine Lune
- Comparaison des avis les nuits de pleine lune vs nuits normales

---

## ✅ Tests de qualité

On vérifie automatiquement que les données sont fiables :
- **not_null** → pas de valeurs vides sur les colonnes importantes
- **unique** → pas de doublons sur les identifiants
- **accepted_values** → les types de logements sont valides

Pour lancer les tests :
```bash
cd dbt_project
dbt test
```

---

## 👤 Auteur

Cédric BOIMIN 

---

## 📬 Soumission

Projet réalisé dans le cadre de l'évaluation **MBAESG_EVALUATION_MANAGEMENT_OPERATIONNEL_2026**
