import streamlit as st
import pandas as pd
import joblib
import json

model = joblib.load('churn_model.pkl')
scaler = joblib.load('scaler.pkl')

with open('feature_names.json', 'r') as f:
    feature_names = json.load(f)

st.title('Customer Churn Predictor')
st.write('Предсказание оттока клиентов')

tenure = st.slider('Время пользования (месяцы)', 0, 72, 24)
monthly_charges = st.number_input('Ежемесячный платеж ($)', 0.0, 200.0, 70.0)
contract = st.selectbox('Тип контракта', ['Month-to-month', 'One year', 'Two year'])
internet = st.selectbox('Тип интернета', ['DSL', 'Fiber optic', 'No'])

if st.button('Рассчитать риск'):
    input_data = pd.DataFrame({
        'tenure': [tenure],
        'MonthlyCharges': [monthly_charges],
        'Contract_Month-to-month': [1 if contract == 'Month-to-month' else 0],
        'Contract_One year': [1 if contract == 'One year' else 0],
        'Contract_Two year': [1 if contract == 'Two year' else 0],
        'InternetService_Fiber optic': [1 if internet == 'Fiber optic' else 0],
        'InternetService_No': [1 if internet == 'No' else 0],
        'InternetService_DSL': [1 if internet == 'DSL' else 0]
    })

    for feature in feature_names:
        if feature not in input_data.columns:
            input_data[feature] = 0

    input_data = input_data[feature_names]

    input_data_scaled = scaler.transform(input_data)

    probability = model.predict_proba(input_data_scaled)[0][1]

    if probability > 0.6:
        st.error(f'🔴 ВЫСОКИЙ РИСК: {probability:.1%}')
        st.write('Рекомендация: Предложить скидку на годовой контракт')
    elif probability > 0.3:
        st.warning(f'🟡 СРЕДНИЙ РИСК: {probability:.1%}')
        st.write('Рекомендация: Проактивное обслуживание')
    else:
        st.success(f'🟢 НИЗКИЙ РИСК: {probability:.1%}')
        st.write('Клиент стабилен')