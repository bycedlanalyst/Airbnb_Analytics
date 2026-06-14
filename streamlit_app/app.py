import streamlit as st
import duckdb
import pandas as pd
import plotly.express as px

# Connexion à DuckDB
DB_PATH = r"C:\Users\boimi\Downloads\Projet_Airbnb_Analytics\data\airbnb.duckdb"

st.set_page_config(page_title="Airbnb Analytics", layout="wide")
st.title("🏠 Airbnb Analytics Platform")

conn = duckdb.connect(DB_PATH)

# Sidebar
st.sidebar.title("Navigation")
page = st.sidebar.radio("Choisir une page", [
    "Listings",
    "Hôtes",
    "Avis",
    "Impact Pleine Lune"
])

# PAGE 1 : Listings
if page == "Listings":
    st.header("📋 Analyse des Logements")
    df = conn.execute("SELECT * FROM main_gold.gold_listings_summary").df()
    st.dataframe(df)
    fig = px.bar(df, x="room_type", y="avg_price", 
                 title="Prix moyen par type de logement",
                 color="room_type")
    st.plotly_chart(fig, use_container_width=True)

# PAGE 2 : Hôtes
elif page == "Hôtes":
    st.header("👤 Analyse des Hôtes")
    df = conn.execute("SELECT * FROM main_gold.gold_hosts_summary LIMIT 20").df()
    st.dataframe(df)
    fig = px.bar(df, x="host_name", y="total_listings",
                 title="Top 20 hôtes par nombre de logements",
                 color="is_superhost")
    st.plotly_chart(fig, use_container_width=True)

# PAGE 3 : Avis
elif page == "Avis":
    st.header("⭐ Analyse des Avis")
    df = conn.execute("SELECT * FROM main_gold.gold_reviews_summary").df()
    st.dataframe(df)
    fig = px.pie(df, names="sentiment", values="total_reviews",
                 title="Répartition des sentiments")
    st.plotly_chart(fig, use_container_width=True)

# PAGE 4 : Pleine Lune
elif page == "Impact Pleine Lune":
    st.header("🌕 Impact des Nuits de Pleine Lune")
    df = conn.execute("SELECT * FROM main_gold.gold_full_moon_impact").df()
    st.dataframe(df)
    fig = px.bar(df, x="sentiment", y="total_reviews",
                 color="night_type", barmode="group",
                 title="Sentiment des avis : Pleine Lune vs Nuit Normale")
    st.plotly_chart(fig, use_container_width=True)

conn.close()