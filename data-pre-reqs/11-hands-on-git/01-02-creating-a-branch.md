# Create a branch

1. Go to your repo
    ```bash
    cd first-repo
    ````
2. Check
    ```bash
    git stauts #always git status
    ```
3. Check your branchs
    ```bash
    git branch
    ````
4. Create a new one
    ```bash
    git checkout -b secondbranch
    ```
5. Create a file
    ```bash
    touch secondfile.py
    ```
6. Check status
    ```bash
    git status
    ```
7. Make git track it
    ```bash
    git add secondfile.py
    ```
8. Git commit and push
    ```bash
    git commit -m "I added a second file"
    git push origin main
    ```
9. Check sttus
    ```bash
    git status
    ```
10. Go back to your main branch
    ```bash
    ls
    ```
Your file disapared! You'll see you don't have that second file you created. It's because it is in another branch.

11. Go to your github
    ```bash
    git remote show origin #and get your url
    ```
12. Open it through terminal
    ```bash
    open YOUR_URL
    ```
13. You can switch between branches in the upper left button. There will be a dropdown menu.