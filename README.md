# 🏭 Smart Factory: Predictive Maintenance & OEE Optimization

**Role:** Industrial Data Analyst  
**Tech Stack:** Python (Pandas), SQL, Tableau, Lean Six Sigma  

![Dashboard Preview](dashboard.png)

### 📌 Business Context
A mid-size manufacturing plant is experiencing unplanned downtime events, reducing Overall Equipment Effectiveness (OEE). The Operations Director requested a data-driven analysis of 10,000 sensor readings to identify the root causes of machine failure and establish predictive maintenance thresholds.

### 🔍 Key Insights & Impact
1. **Bottleneck Identification:** "Low Quality" (L) product variants account for **235 of 339 machine failures (~69%)**, despite representing only 6,000 of 10,000 production runs, making them the highest-risk product tier in the portfolio.

2. **Root Cause – Heat Dissipation:** Heat Dissipation Failures (HDF) occur when the average temperature delta (Process − Air) drops to around **8.23 K**, compared with **10.02 K** during normal operation, indicating that a narrower temperature delta is associated with higher failure risk.

3. **Overall Reliability Level:** Across all product types, there are **339 machine failures** out of 10,000 runs, with failure rates of **3.92% for L**, **2.77% for M**, and **2.09% for H**, highlighting that L‑type machines are significantly less reliable than higher‑tier variants.

### 🛠 Technical Approach
- **Data Engineering (Python):** Cleaned the AI4I 2020 predictive maintenance dataset (10,000 sensor readings) and engineered `Power_Watts` and `Temp_Delta` features to approximate mechanical strain and heat transfer efficiency.
- **Analysis (SQL via SQLite):** Loaded the cleaned dataset into an in‑memory SQLite database as `production_data` and wrote analytical queries to compute failure rates by product tier (L/M/H), quantify the temperature threshold for Heat Dissipation Failures, and identify tool wear patterns at failure.
- **Visual Monitoring (Tableau):** Built an interactive process control dashboard to monitor failure distribution by product type and visualize the safe operating zone using torque vs rotational speed scatter plots, with failures color-coded to highlight risk clusters.

### 📊 Interactive Dashboard
**👉 [View Live Tableau Dashboard](https://public.tableau.com/views/SmartFactory-PredictiveMaintenanceOEE/SmartFactoryProductionLineOEEMonitor)**

The dashboard includes:
- **Current Reliability KPI:** Total failures (339) displayed as a headline metric
- **Failure by Type Bar Chart:** Breakdown showing L-type (235 failures), M-type (83), and H-type (21)
- **Operating Zone Scatter Plot:** 10,000 data points plotting torque vs rotational speed, with normal operations shown in blue and failure events highlighted to reveal high-risk operating conditions

### 💻 Code Snippet (Feature Engineering)
```python
# Calculating physical work to approximate mechanical strain
df['Power_Watts'] = df['Torque_Nm'] * df['Rotational_Speed_RPM']

# Isolating temperature efficiency (process vs ambient)
df['Temp_Delta'] = df['Process_Temp_K'] - df['Air_Temp_K']
