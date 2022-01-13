# Creating your second python script
This time making sure you're in your environment.

1. Open Terminal
2. Make sure you're on your demo folder
    ```bash
    pwd
    ```
4. Create a hello-world.py
    ```bash
    touch importing-things.py
    ```
5. Open VSC
    ```bash
    code .
    ```
6. Edit the file. Write:
    ```python
    import pandas as pd
    import numpy as np

    a = np.array([2,3,4])
    print(a)

    print(pd.show_versions)
    ```
6. Save: `cmmd + s`
7. From terminal, run the file:
    ```bash
    python3 importing-things.py
    ```
8. Did it work? There's two things you should check: 
- 8.1.: You are in the environment you need to be (ironhack, not base)
- 8.2.: You have numpy and pandas installed


**8.1.:Change your environment** (in VSC)
- If you don't see this:

    - Do `cmmd + shift + p`
    - Type: `Select: python interpreter`
    - Select your **ironhack** environment

- If you do, select your ironhack environment


**8.2.: Install** (go to your terminal)

```bash
conda activate ironhack
```

```bash
pip install pandas
pip install numpy
```

**9. Run the file again**
```bash
python3 importing-things.py
```

You should be things printed on the screen with no errors.