# 6. SQL

**6.1. Installation**

To install mySQL in our computer we will need to install two differents programs: 

- **6.1.1 SQL Server**  

    - In the terminal: 

            sudo apt update sudo apt install mysql-server
            sudo /etc/init.d/mysql start # to elevate the server
    
        ⚠️ When you run this last code you will get a warning in the terminal. Nothing happens, we can continue working ⚠️ 
    - SQL configuration

            # In the terminal
            sudo mysql -u root -p

        ```SQL
        USE mysql; 

        ALTER USER 'root'@'localhost' 
        IDENTIFIED WITH mysql_native_password BY 'admin';
        #Substitute 'admin' by your password if you want
        FLUSH PRIVILEGES; 
        
        QUIT;
        ```

- **6.1.2 Workbench**   
    To install Workbench we should open our browser and go to the mySQL [website](https://dev.mysql.com/downloads/workbench/)

    ⚠️ In this case, we download the windows version ⚠️

**6.2. Init the server**

Before opening Workbench it is necessary that we start the mySQL server in the terminal. For that, we put in the terminal:

    sudo /etc/init.d/mysql start