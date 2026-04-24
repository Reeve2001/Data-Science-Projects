# Portfolio Optimization using Modern Portfolio Theory

## Overview
This project focuses on optimizing a stock portfolio using **Modern Portfolio Theory (MPT)** to achieve the best risk-return tradeoff. 

Using historical stock data, multiple portfolio combinations are simulated to identify the **optimal allocation** that maximizes returns for a given level of risk.

---

## Objective
- Analyze risk and return of selected stocks
- Generate multiple portfolio combinations
- Identify the optimal portfolio using **Sharpe Ratio**
- Visualize the **Efficient Frontier**

---

## Tools & Technologies
- Python  
- NumPy  
- Pandas  
- Matplotlib  
- yfinance  

---

## Methodology

1. **Data Collection**
   - Historical stock price data fetched using `yfinance`
   - Adjusted prices used to account for stock splits and dividends  

2. **Data Processing**
   - Daily returns calculated using percentage change  
   - Mean returns and covariance matrix computed  

3. **Monte Carlo Simulation**
   - Generated 5000 random portfolios  
   - Assigned random weights to each asset  
   - Calculated:
     - Expected annual return  
     - Portfolio volatility (risk)  
     - Sharpe ratio  

4. **Optimization**
   - Identified portfolio with **maximum Sharpe ratio**  
   - Compared risk-return combinations  

---

## Results

- Efficient Frontier plotted showing risk vs return  
- Optimal portfolio identified based on Sharpe Ratio  
- Demonstrated tradeoff between risk and return  

---

## Key Insights

- Diversification reduces portfolio risk  
- Optimal allocation depends on both returns and correlations  
- Higher return portfolios often come with higher volatility  

