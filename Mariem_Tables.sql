create table intake(
intake_id int identity (1,1)primary key,
intake_name varchar(50) not null,
intake_start_date date not null,
intake_end_date date not null );
 
 create table branchintake(
 branch_id int not null,
 intake_id int not null,
 primary key(branch_id,intake_id),
 foreign key (intake_id) references intake(intake_id),
 foreign key (branch_id) references branch(branch_id),
);

create table studentanswer(
stuans int identity (1,1) primary key,
answer varchar(255),
iscorrect bit
);
create table truefalsequestion(
trfaid int identity (1,1) primary key,
question text not null,
correctanswer bit not null,
question_id int not null,
foreign key (question_id) references question_pool(question_id)
);
create table truefalseanswer(
asnwerid int identity (1,1) primary key,
trfaid int not null,
answer1 bit,
answer2 bit,
constraint TrueFalseId foreign key (trfaid)references truefalsequestion(trfaid)
);