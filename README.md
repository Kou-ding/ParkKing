# ParkKing
The materialization of a concept application aiming to simplify parking in smart cities. It includes all three assignments of the course "Databases" throughout the semester.

Including:
- design: Includes the process of designing a database. 
- create: Translates the design into a real database using MysqlWorkbench.
- application: Sees the entire application, for which we built our database, come to fruition.

### Notes
To create an sql dump:
```bash
# Install mariadb tools
sudo pacman -S 

# Generate dump into an sql file
mariadb-dump -u username -p database_name > dump_file.sql
# usually username = root

```