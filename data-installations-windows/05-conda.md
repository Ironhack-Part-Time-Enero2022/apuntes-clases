# 5. Conda

**5.1. Installation**
⚠⚠ REALLY REALLY IMPORTANT, the version that we download should be for **LINUX** ⚠⚠

- To install we should open our browser and go to the Anaconda [website](https://www.anaconda.com/products/individual)

- Next write in the terminal: 

        wget https://repo.continuum.io/archive/[YOUR VERSION] 
        If the file that you downloades i: Anaconda3-2020.11-Linux-x86_64.sh you should type: 

        wget https://repo.continuum.io/archive/Anaconda3-2020.11-Linux-x86_64.sh
- Then:   

        bash Anaconda3-2020.11-Linux-x86_64.sh

- Finally you must close the terminal and open again. 

**5.2. Create an environment**
- Create an environment:  

        conda create --name ironhack

- Activate the environment:

        source activate ironhack  


- Install ipykernel:

        conda install -c anaconda ipykernel
        python -m ipykernel install --user --name=ironhack

- Open jupyter notebook:  

        jupyter notebook

- Create a new jupyter notebook selecting your kernel as: `ironhack`

In a cell:
```python
import numpy as np
```
🚨 If it returns 'module not found', go back to your terminal and within your environment, do: 

        pip3 install numpy

