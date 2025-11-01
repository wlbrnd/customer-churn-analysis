# HR Analytics: Employee Turnover Prediction

## Project Overview
Machine learning project to predict employee turnover using Random Forest classifier. The project includes comprehensive data analysis, feature engineering, model training, and interactive Tableau dashboards.

## Business Problem
Predict employees at high risk of leaving to enable proactive retention strategies and reduce turnover costs.

## Dataset
- **Source**: Kaggle HR Analytics
- **Size**: 19,000+ employee records
- **Key Features**: education level, work experience, company type, training hours, city development index, major discipline

## Technical Implementation

### Data Science Stack
- **Data Processing**: Pandas, NumPy
- **Machine Learning**: Scikit-learn (Random Forest, Logistic Regression)
- **Database**: SQLite for data analysis
- **Visualization**: Tableau

### Model Performance
- **Random Forest Accuracy**: 77.8%
- **Logistic Regression Accuracy**: 77.0%
- **Key Metrics**:
  - Precision: 84%
  - Recall: 88%
  - F1-Score: 86%

## Dashboard Insights

### Education & Experience Analysis
Highest Risk: Employees with higher education (Graduate/Masters) and 1-6 years of experience
Stability Pattern: Risk decreases significantly with experience beyond 6 years

## Company Type Risk
Highest Risk: Unknown company types
Established Companies: Public Sector and Pvt Ltd demonstrate lower risk profiles

## Experience-Based Risk
Strong Correlation: Inverse relationship between experience and turnover risk
Critical Phase: Employees with <1-3 years experience at highest risk

## Major Discipline Analysis
Highest Risk: "Other" and STEM majors
Moderate Risk: Business Degree and Humanities
Lower Risk: Arts and No Major categories

## Geographic Risk Distribution
High-Risk Cities: city_21, city_11 show highest turnover probability
Development Correlation: Cities with lower development indices demonstrate higher risk

## Key Business Findings

### High-Risk Groups Identified
- Employees in Unknown company (39% higher risk)
- Specific city locations with lower development indices
- Early-career professionals (1-3 years experience)

### Retention Opportunities
- Training hours significantly impact retention
- Geographic factors play crucial role in turnover
- Company type strongly influences employee stability

## Project Structure
```
HR-Analytics-Project/
├── data/
│   ├── aug_train.csv/                    # Original train datasets
│   ├── aug_test.csv/                    # Original test datasets
│   └── feature_importance.csv/              # Data for dashboard
├── notebooks/
│   └── HR_Employee_Turnover_Analysis.ipynb
├── sql/
│   └── queries.sql
├── dashboard/
│   ├── dashboard1.png/                  
│   ├── dashboard2.png/                   
│   ├── dashboard3.png/                    
│   ├── dashboard4.png/                   
│   └── HR_Analytics_Dashboard.twb
├── .gitignore
├── LICENSE
└── README.md
```

## Dashboard Features
- **Interactive Risk Matrix**: Education level vs Experience heat map
- **Comparative Analysis**: Risk across company types and disciplines
- **Geographic Intelligence**: City-based risk mapping
- **ML Insights**: Feature importance and model performance
- **Strategic Prioritization**: High-risk employee identification

## Installation & Usage
1. Clone repository: `git clone [repository-url]`
2. Install dependencies: `pip install -r requirements.txt`
3. Run Jupyter notebooks for data processing and model training
4. Open `HR_Analytics_Dashboard.twbx` in Tableau for interactive analysis

## Technical Requirements
- Python 3.8+
- Tableau Desktop 2022+
- Key Libraries: pandas, scikit-learn, matplotlib, sqlite3

## Business Impact
This analysis enables HR departments to:
- Proactively identify at-risk employees
- Allocate retention resources effectively
- Develop targeted intervention strategies
- Reduce turnover costs through data-driven decisions
