CREATE DATABASE JWEB_Final
USE JWEB_Final

Create table Team (
    id              int             primary key identity(1,1),
    team_name       VARCHAR(200)    not null,
    coach_name      VARCHAR(200),
    [rank]          int             CHECK([rank] > 0)
)