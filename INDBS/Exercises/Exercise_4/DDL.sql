create table Ranking (
  id serial primary key,
  name varchar(50) unique not null,
  startyear integer not null
);

create table IndividualRanking (
  id integer references Ranking(id) primary key,
  gender char(1) not null check (gender in ('M','F','X')),
  age_group varchar(50) not null
);

create table ClubRanking (
  id integer references Ranking(id) primary key
);

create table NationalClubRanking (
  id integer references ClubRanking(id) primary key,
  nationality varchar(50) not null
);

create table GlobalClubRanking (
  id integer references ClubRanking(id) primary key
);

create table Dane (
  id serial primary key,
  gender char(1) not null check(gender in ('M','F')),
  name varchar(50) not null check(name <> ''),
  nationality varchar(50) not null,
  ranking integer references IndividualRanking(id) not null,
  rank integer not null
);

create table Club (
  id serial primary key,
  natinoality varchar(50) not null,
  name varchar(50) not null,
  national_ranking integer references NationalClubRanking(id) not null,
  national_rank integer not null,
  global_ranking integer references GlobalClubRanking(id) not null,
  global_rank integer not null
);

create table Membership (
  start_date date not null, 
  end_date date default null,
  daneid integer references Dane(id),
  clubid integer references Club(id),
  primary key (daneid, clubid, start_date)
);

create table Sponsor (
  id serial primary key,
  name varchar(50) not null,
  nationality varchar(50) not null
);

create table DaneSponsorship (
  daneid integer references Dane(id) not null,
  sponsorid integer references Sponsor(id) not null,
  amount real not null,
  primary key(daneid, sponsorid)
);

create table ClubSponsorship (
  clubbid integer references Club(id),
  sponsorid integer references Sponsor(id) primary key,
  amount real not null,
  deal text not null
);

create table Employee (
  id serial primary key,
  name varchar(50) not null
);

create table Tournament (
  id serial primary key, 
  date date not null,
  venue varchar(50) not null,
  name varchar(50) not null,
  organizer_clubid integer references Club(id) not null,
  monitor_employeeid integer references Employee(id) not null
);

create table League (
  id serial primary key,
  tournamentid integer references Tournament(id) not null,
  number integer not null,
  duration integer not null,
  gender char(1) not null check (gender in ('M', 'F', 'X')),
  name varchar(50) not null,
  unique (tournamentid, gender, number)
);

create table Participates (
  id serial primary key,
  daneid integer references Dane(id) not null,
  leagueid integer references League(id) not null,
  rank integer default null,
  unique (daneid, leagueid)
);

create table ParticipationPayment (
  clubid integer references Club(id) not null,
  parcicipation integer references Participates(id) primary key
);

create table Problem (
  id serial primary key,
  name varchar(50) not null unique,
  dancetxt text not null,
  programtxx text not null
);

create table LeagueProblem (
  leagueid integer references League(id),
  problemid integer references Problem(id)
);

create table SolvedProblem (
  participationid integer references Participates(id),
  problemid integer references Problem(id),
  program_score integer not null check (program_score between 0 and 100),
  dance_score integer not null check (dance_score between 0 and 100)
);

create table ProblemAuthor (
  employeeid integer references Employee(id),
  problemid integer references Problem(id)
);

create table TestCase (
  problemid integer references Problem(id),
  name varchar(50) not null unique, 
  ordinal integer not null check (ordinal >= 0),
  inputtxt text, 
  outputtxt text not null
);
