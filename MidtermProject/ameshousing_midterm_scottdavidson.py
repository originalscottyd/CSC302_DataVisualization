# -*- coding: utf-8 -*-
"""AmesHousing_Midterm_ScottDavidson.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1rT_otzVQ0SBr-2dW8_RT6T4GeqKOljxH
"""

from google.colab import drive
drive.mount('/content/drive')

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb

housing = pd.read_excel('/content/drive/MyDrive/DATA/Housing Data workbook 2.xlsx', sheet_name='DA_-_housing-price-data-0404201')
housing.head()

housing.info()

housing.SalePrice.describe()

housing.SalePrice.median()

sb.lineplot(data=housing, x='YrSold', y='SalePrice', marker='o')

plt.xlabel('Years')
plt.ylabel('Avg. Sale Price')
plt.title('Ames, IA: Average Home Sale Price 2006-2010')

sb.histplot(housing['SalePrice'])
plt.title('Sale Price Distribution 2006-2010')

ax = sb.barplot(x='YrSold', y='SalePrice',
                 data=housing,
                 errwidth=0, color='steelblue')

for i in ax.containers:
    ax.bar_label(i,)
ax.set_ylabel("Avg. Sale Price (USD)")
ax.set_xlabel("Year")
ax.set_title('Ames, IA: Average Home Sale Price Price 2006-2010')