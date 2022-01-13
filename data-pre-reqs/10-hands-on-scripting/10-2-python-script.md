# Creating your first python script

1. Open Terminal
2. Make sure you're on your demo folder

    ```bash
    pwd
    ```
4. Create a hello-world.py
    ```bash
    touch hello-world.py
    ```
5. Open VSC
    ```bash
    code .
    ```
6. Edit the file. Write:
    ```python
    print("Hello world")
    ```
6. Save: `cmmd + s`
7. From terminal, run the file:
    ```bash
    python3 hello-world.py
    ```
8. You should see "Hello world!" printed in your terminal

Some other lines of code you can try:
- A simple function
```python
#Defining a function
def addition(a, b):
    solution = a + b
    return solution

#Calling the function
print(addition(2, 3))
```
