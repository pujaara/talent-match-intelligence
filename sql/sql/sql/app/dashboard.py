import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

st.set_page_config(page_title="Talent Match Dashboard", layout="wide")
st.title("Talent Match Intelligence Dashboard")

# Contoh data
data = pd.DataFrame({
    'Employee': ['Andi Saputra', 'Rina Lestari'],
    'Role': ['Data Analyst', 'Business Analyst'],
    'TV Match (%)': [85, 78],
    'TGV Match (%)': [83, 75],
    'Final Match (%)': [82, 76]
})

st.dataframe(data)

st.subheader("Final Match Visualization")
fig, ax = plt.subplots()
ax.bar(data['Employee'], data['Final Match (%)'])
ax.set_ylabel("Match Percentage")
st.pyplot(fig)

st.caption("Dashboard ini menampilkan hasil perhitungan kecocokan kandidat berdasarkan benchmark perusahaan.")
