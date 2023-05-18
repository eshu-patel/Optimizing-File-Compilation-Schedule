Sets

i file number /1*10/, m number of servers /1*2/;


alias(i,ii);
alias(m,mm);

$ontext
*Dataset 3

Parameter d(i)
/1 20,2 20, 3 40, 4 45, 5 50, 6 60, 7 40, 8 80, 9 60, 10 80, 11 80, 12 85, 13 90, 14 100, 15 100, 16 120, 17 120, 18 130, 19 125, 20 130/;

Parameter comp(i)
/1 5,2 10, 3 15, 4 12, 5 15, 6 17, 7 11, 8 7, 9 10, 10 12, 11 14, 12 10, 13 16, 14 13, 15 18, 16 9, 17 11, 18 10, 19 15, 20 18/;

Parameter rep(i)
/1 5,2 4, 3 9, 4 8, 5 6, 6 3, 7 4, 8 5, 9 7, 10 5, 11 6, 12 8, 13 5, 14 4, 15 6, 16 4, 17 6, 18 5, 19 8, 20 9/;

Parameter goals(i)
/1 10,2 15, 3 12, 4 16, 5 8, 6 6, 7 20, 8 22, 9 11, 10 15, 11 5, 12 6, 13 7, 14 15, 15 20, 16 12, 17 11, 18 10, 19 21, 20 25/;

Parameter target(i)
/1 1,2 1, 3 1, 4 1, 5 1, 6 1, 7 1, 8 1, 9 1, 10 1, 11 1, 12 1, 13 1, 14 1, 15 1, 16 1, 17 1, 18 1, 19 1, 20 1/;

Table dep(i,ii)
    1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20
1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
2   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
3   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
4   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
5   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
6   0   0   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
7   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
8   0   0   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0
9   0   0   1   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
10  0   0   0   0   0   1   0   0   1   0   0   0   0   0   0   0   0   0   0   0
11  0   0   0   1   1   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0
12  0   0   0   0   0   1   0   1   1   0   0   0   0   0   0   0   0   0   0   0
13  0   0   0   0   0   0   1   0   1   0   1   0   0   0   0   0   0   0   0   0
14  0   0   0   0   0   0   0   1   0   1   0   1   0   0   0   0   0   0   0   0
15  0   0   0   0   0   1   0   1   0   0   1   0   0   0   0   0   0   0   0   0
16  0   0   0   0   0   0   0   0   1   0   0   0   1   1   1   0   0   0   0   0
17  0   0   0   0   0   0   0   1   0   0   0   1   0   1   1   0   0   0   0   0
18  0   0   0   0   0   1   0   0   0   0   0   0   1   1   1   0   0   0   0   0
19  1   0   0   0   0   0   0   0   0   0   0   1   0   0   1   1   1   0   0   0
20  0   0   0   0   0   0   0   1   0   1   0   0   0   0   1   1   1   0   0   0;

*$offtext

$ontext
* Dataset 1
Parameter d(i) deadlines
/1 10000000,2 10000000,3 10000000,4 40,5 100,6 53/;

Parameter rep(i) replication
/1 5,2 18,3 35,4 52,5 52,6 21/;

Parameter goals(i) 
/1 0,2 0,3 0,4 8,5 15,6 35/;

Parameter target(i) deadlines
/1 0,2 0,3 0,4 1,5 1,6 1/;

Parameter comp(i) Compilation time of files
/1 15,2 10,3 15,4 13, 5 20,6 15/;

TABLE dep(i,ii) time for ith order on mth machine
    1   2   3   4   5   6 
1   0   0   0   0   0   0
2   0   0   0   0   0   0
3   1   0   0   0   0   0
4   0   1   0   0   0   0
5   0   1   1   0   0   0
6   0   0   1   1   0   0;
$offtext

*$ontext

* Dataset 2
Parameter comp(i)
/1 15,2 10, 3 15, 4 13, 5 20, 6 15, 7 8, 8 10, 9 11, 10 15/;

Parameter rep(i)
/1 5,2 8,3 5,4 5,5 5,6 7,7 8,8 10,9 10,10 12/;

Parameter goals(i)
/1 0,2 0,3 0,4 8,5 15,6 35,7 30,8 40,9 45,10 50/;

Parameter target(i)
/1 0,2 0,3 0,4 1,5 1,6 1,7 1,8 1,9 1,10 1/;

Parameter d(i)
/1 10000000,2 10000000,3 10000000,4 40,5 100,6 53,7 75,8 90,9 110,10 125/;

Table dep(i,ii)
    1   2   3   4   5   6   7   8   9   10  
1   0   0   0   0   0   0   0   0   0   0   
2   0   0   0   0   0   0   0   0   0   0   
3   1   0   0   0   0   0   0   0   0   0  
4   0   1   0   0   0   0   0   0   0   0   
5   0   1   1   0   0   0   0   0   0   0   
6   1   1   1   1   0   0   0   0   0   0   
7   0   1   1   1   1   0   0   0   0   0   
8   1   0   1   1   1   0   0   0   0   0   
9   0   0   1   0   1   1   1   0   0   0   
10  0   0   1   1   1   0   1   0   0   0;

*$offtext

Scalar U;
U = sum(i,comp(i));

Variables ts(i),x(i,m),y(i,ii),obj,reward(i);

Binary Variables x(i,m),y(i,ii); 

Equations Eqn17(i),Eqn18(i),Eqn19(m),Eqn20(i,ii,m),Eqn21(i,ii),Eqn22(i,ii),Eqn23(i,ii,m,mm), Eqn24(i,ii,m), Eqn25(i),Objective;

Objective .. obj =e= sum(i $ (d(i) <> 1000000),reward(i));

Eqn17(i) .. ts(i) =l= d(i) - sum(m,comp(i)*x(i,m));

Eqn18(i) .. sum(m,x(i,m)) =e= 1;

Eqn19(m) .. sum(i,comp(i)*x(i,m)) =l= smax(i ,d(i));

Eqn20(i,ii,m)$(ord(ii)>ord(i)) .. y(i,ii) + y(ii,i) =g= x(i,m) + x(ii,m) - 1;

Eqn21(i,ii)$(ord(ii) <> ord(i)) .. ts(ii) =g= ts(i) + sum(m,comp(i)*x(i,m)) - U*(1-y(i,ii));

Eqn22(i,ii)$(ord(ii)>ord(i)) .. y(i,ii) + y(ii,i) =l= 1;

Eqn23(i,ii,m,mm)$((ord(ii)>ord(i))  and (ord(mm)<>ord(m))) .. y(i,ii) + y(ii,i) + x(i,m) + x(ii,mm) =l= 2;

Eqn24(i,ii,m) .. ts(i) =g= dep(i,ii)*( ts(ii) + comp(ii) + (x(i,m)* (1- x(ii,m)))*rep(ii)) ;

Eqn25(i)  .. reward(i) =e= target(i)*(goals(i) + (d(i) - (ts(i) + comp(i))));

model jssp /all/;

solve jssp using minlp maximizing obj;

display "SOLUTIONS" x.l , ts.l;