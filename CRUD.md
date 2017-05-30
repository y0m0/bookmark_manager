## CRUD

is an acronym used to describe the four basic function of persistent storage in computer programming, and it stands for:  
- Create
- Read
- Update
- Delete

## SQL

SQL is a standard language for storing, manipulating and retrieving data in databases.


## CRUD and SQL

Each of the four basic functions of CRUD if viewed from the prospective of a SQL database can be translated to actual database queries:  

#### Create
```
INSERT INTO table (column1 [, column2, column3 ... ]) VALUES (value1 [, value2, value3 ... ]);
```

### Read
```
SELECT * FROM table WHERE value1 = 'some value';
```

### Update
```
UPDATE table SET value1 = 'new value' WHERE value1 = 'some value';
```

### Delete
```
DELETE FROM table WHERE value1 = 'new value';

```
