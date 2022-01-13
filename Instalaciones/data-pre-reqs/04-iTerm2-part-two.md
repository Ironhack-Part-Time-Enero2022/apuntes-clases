### 💻 Navigating to your `.zshrc` file:
1. Open your Terminal.
2. Run `cd` (to go your root. Your root is the folder that contains Library, Movies, Music, etc.)
3. Run `code .`
4. It didn't work? Don't worry. Just open VSC and go to your root manually.
4. You should now be able to find the `.zshrc` file to your left.
5. Open it.

That's it! You now know how to access your `.zshrc` file. 
### 💻 Changing the theme to agnoster

1. Navigate to your `.zshrc` file.
2. Do `cmmd + F` and look for "robbyrussell".
3. Substitute that name for `agnoster`
4. You should have a line like: `ZSH_THEME="agnoster"`
5. Save: `cmmd + s`.

### 💻 More configuration for agnoster

1. Open your Terminal.
2. Do `cmmd` + `,`. Or just go to preferences of iTerm2
3. Go to Profiles > Text
4. Check the box for Use built-in Powerline glyphs

### 💻 Checking the `code .` command works.

We tried to install it through VSC earlier. It doesn't always work, so let's check! 
1. Open your Terminal.
2. Run `ls`.
3. Now move into any folder by doing `cd any_folder__you_see`. i.e. `cd Desktop`.
4. Now run `code .`.

VSC should open in the same path you're at now. To the left, you should see an Explorer menu that shows the content of the folder tou entered.

If nothing happened when you ran `code .` or you're ina different path, do:


### 💻 Troubleshooting the `code .` command:
This section is only necessary if the command didn't work.

1. Navigate to your `.zshrc` file.
4. Paste this line anywhere: `export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"`.
5. Save: `cmmd + S`.
6. Quit VSC and iTerm2
7. Repeat the process to check if the command works.


### 💻 Creating an alias

1. Navigate to your `.zshrc` file.
2. Open it and create an alias:

    ```bash
    alias hello="echo 'Hello world!'"
    ````

5. Save: `cmmd + S`.
6. Quit VSC and iTerm2.
7. Open iTerm2 and write: `hello`.

Your output should be: Hello world! If it is, congrats! You just created your first alias. 

**Your iTerm2 is all set 🤩**

# Summing up

1. Wherever you are in your terminal, you will be able to open VSC from the command line in that same path by running `code .` Trust me, you'll be thankful in the future. 
2. You now know how to create aliases. This will come in handy for highly used commands. 