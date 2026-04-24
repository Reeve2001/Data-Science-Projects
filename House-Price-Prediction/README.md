# Housing Price Prediction

## Overview
This project aims to predict residential property prices in Bengaluru using machine learning techniques and identify key factors influencing housing prices.

---

## Problem Statement
The objective is to build a predictive model that estimates housing prices based on property features such as size, location, and amenities.

---

## Dataset
The dataset contains information about residential properties in Bengaluru, including:

- Total square footage  
- Number of bathrooms  
- Number of balconies  
- Location  
- Price (in lakhs)  

---

## Tech Stack
- Python  
- Pandas  
- NumPy  
- Scikit-learn  
- Matplotlib / Plotly  
- Jupyter Notebook  

---

## Project Workflow

1. **Data Loading**
2. **Data Exploration & Cleaning**
3. **Outlier Detection and Removal**
4. **Multicollinearity Check**
5. **Feature Engineering**
6. **Train-Test Split**
7. **Model Building using Scikit-learn Pipeline**
8. **Model Evaluation using Mean Absolute Error (MAE)**

---

## Model Performance

- Mean Property Price: ₹74 lakhs  
- Training MAE: ₹11 lakhs  
- Test MAE: ₹13 lakhs  
- Approximate Error: ~18%  

The small gap between training and test error indicates good generalization and minimal overfitting.

---

## Key Insights

- Property location has a significant impact on pricing  
- Total square footage shows strong correlation with price  
- Outlier removal improved model performance  
- Pipeline-based preprocessing ensured consistent and reproducible transformations  

---

## Conclusion
The model successfully captures key drivers of housing prices and provides reasonably accurate predictions. The approach demonstrates the effectiveness of data cleaning, feature engineering, and pipeline-based modeling in real-world datasets.
