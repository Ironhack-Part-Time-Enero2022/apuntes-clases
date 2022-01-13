# 6. Conda

If you're here you probably already installed anaconda. Anaconda is a great tool that glues together a bunch of tools for python. However, there's some downsides to it: one being that it might be slow and also that it takes up too much space on your machine.

You can either leave it like that, or use **miniconda**, which is a much lighter program with the same features, which is also recommended.

If you want to switch, first, we'll uninstall:
```bash
rm -rf ~/anaconda3
````

#### 6.1. Installing miniconda
```bash
brew install --cask miniconda
```

#### 6.2. Create an environment

1. Open your **terminal** and:
    ```bash
    conda init zsh
    ```
2. **Create** an environment
    ```bash
    conda create --name ironhack
    ```
3. **Activate** the environment
    ```bash
    conda activate ironhack
    ```
4. Install **ipykernel**
    ```bash
    conda install -c anaconda ipykernel
    python -m ipykernel install --user --name=ironhack
    ```
5. Open **jupyter notebook**
    ```bash
    jupyter notebook
    ````
6. Create a new jupyter notebook selecting your **kernel** as: ironhack
7. In a cell:
    ```python
    import numpy as np
    ```
8. If it returns **'module not found'**, go back to your terminal and within your environment, do:
    ```bash
    pip install numpy
    ```
9. Congrats! You now have a **jupyter notebook** that with a new **environment** and with a **library** that you installed through **pip**.

