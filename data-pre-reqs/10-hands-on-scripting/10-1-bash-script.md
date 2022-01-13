# Creating your first bash script

1. Open Terminal
2. Navigate to your desktop
    ```bash
    cd Desktop
    ```
    check you're on desktop:
    ```bash
    pwd
    ```
3. Create a directory
    ```bash
    mkdir demo
    ```
4. Go into the folder
    ```bash
    cd demo
    ```
4. Create a file.sh
    ```bash
    touch hello-world.sh
    ```
5. Open VSC
    ```bash
    code .
    ```
6. Edit the file in VSC. Write:
    ```bash
    echo "Hello world!"
    ```
6. Save: `cmmd + s`
7. From terminal, run the file:
    ```bash
    bash hello-world.sh
    ```
8. You should see "Hello world!" printed in your terminal

Some other lines of code you can try:

- Congrats
```bash
say -v Alex "Congratulations on your first bash script"
```
- Good morning
```bash
echo "Good morning"
open https://github.com
```
