# 2. Git & github

Git is a version control software. It trackes the changes made to a document or a group of documents.

##### 1. Let's install git:
```bash
brew install git
```

##### 2. Go to github and create an account: https://github.com

##### 3. Tell git what your github info is:

Please do **make sure** that you replace “YOUR_GITHUB_USERNAME” by your actual username. Same with your email.

```bash
git config --global user.name “YOUR_GITHUB_USERNAME”;
git config --global user.email YOUR_EMAIL@DOMAIN.COM
```

##### 4. Run this command so that you won't be asked your github password every time:
```bash
git config --global credential.helper store 
```

We are doing this so that next time you want to use git, you won't be asked for your password.