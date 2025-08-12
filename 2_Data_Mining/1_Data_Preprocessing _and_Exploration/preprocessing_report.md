## Section 2: Data Mining — Task 1: Data Preprocessing and Exploration

### 1. Dataset Description
For this task, the Iris dataset from scikit-learn was used.
It contains 150 samples across three species of Iris (setosa, versicolor, and virginica) with four numeric features:

- Sepal Length (cm)

- Sepal Width (cm)

- Petal Length (cm)

- Petal Width (cm)

The target variable is the species of the flower. The dataset is well-balanced with 50 samples per class.

### 2. Data Loading
The dataset was loaded into a Pandas DataFrame using the following approach:

```

from sklearn.datasets import load_iris
import pandas as pd

iris = load_iris(as_frame=True)
df = iris.frame

```

The dataset shape was (150, 5) with no missing values detected.

### 3. Preprocessing Steps
- Missing Values Check:

    - Used df.isnull().sum() to confirm there were no missing entries in any column.

- Feature Scaling:

    - Applied Min-Max Scaling (range 0–1) to numerical features using MinMaxScaler from sklearn.preprocessing.

    - This ensures all features contribute equally to distance-based algorithms such as K-Means.

- Label Encoding:

The target species column was converted into one-hot encoded columns (species_0, species_1, species_2) to make it suitable for certain machine learning models.

### 4. Data Exploration
- Summary Statistics:

    - Computed using df.describe().

    - The mean, standard deviation, min, and max values indicated that petal length and petal width have the highest variation across species, suggesting these features are strong differentiators.

- Pairplot Visualization:

    - A Seaborn pairplot showed clear separation between species in the petal measurements, while sepal measurements overlapped more.

- Correlation Heatmap:

    - Strong positive correlation was observed between petal length and petal width (r ≈ 0.96).

    - Sepal length also had moderate positive correlation with petal length and width.

- Outlier Detection:

- Boxplots for each feature revealed a few mild outliers in sepal width, but none were extreme enough to require removal.

### 5. Train/Test Split Function

- A reusable function was created to split the dataset into training (80%) and testing (20%) sets:

```
from sklearn.model_selection import train_test_split

def split_data(X, y, test_size=0.2, random_state=42):
    return train_test_split(X, y, test_size=test_size, random_state=random_state)
```

This ensures reproducible splits for downstream modeling.

### 6. Conclusion
The preprocessing stage produced a scaled, clean, and encoded dataset ready for machine learning.
Exploration highlighted that petal measurements are more distinctive for species classification than sepal measurements.
The dataset’s balanced nature and lack of missing data reduce preprocessing complexity, allowing focus on model experimentation in subsequent tasks.
