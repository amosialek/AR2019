use BlockDist;
use Time;
var timer:Timer;
config const n=10;
config const minIters = 0;
config const iters = 0;
const h=10.0/(n+1.0), p=0.05, T=1;
const BigD = {0..n+1, 0..n+1},
		D = BigD[1..n, 1..n],
	LastRow = D.exterior(1,0);
var A, Temp : [BigD] real;
const DW = BigD.expand(-1,-1);
A[BigD] = 0.0;
A[D]=-0.1;

var BlockedD = D dmapped Block(boundingBox=D); 


var red_odd= BlockedD by 2 align (1,1);
var red_even= BlockedD by 2 align (2,2);


var black_odd= BlockedD by 2 align (1,2);
var black_even= BlockedD by 2 align (2,1);
timer.start();
for x in 1..iters do {
    forall(i,j) in black_odd do{
		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
    
//	Temp[i,j] = here.id;
}
    forall(i,j) in black_even do{
		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;

//	Temp[i,j] = here.id;
}
    forall(i,j) in red_odd do{
		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
//	Temp[i,j] = here.id;
}
    forall(i,j) in red_even do{
		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
//	Temp[i,j] = here.id;
}
}
timer.stop() ;
// var iters=0;
// var delta = 1.0;
// do {
// 	iters+=1;
//     forall(i,j) in black_odd do
// 		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
    
//     forall(i,j) in black_even do
// 		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;

//     forall(i,j) in red_odd do
// 		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
	
//     forall(i,j) in red_even do
// 		A[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;

// 	if(iters>minIters) then
// 		delta = A[n/2,n/2];
// } while (delta>-0.36 );

writeln("Time: ", timer.elapsed(TimeUnits.milliseconds));
 //writeln(Temp);
 //writeln(A);
//writeln(iters);
