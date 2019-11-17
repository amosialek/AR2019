use BlockDist;
use Time;
var timer: Timer;
config const n=9,
		epsilon = 1.0e-5,
		minIters=0,
		iters=0;
const h=10.0/(n+1.0), p=0.05, T=1;
const BigD = {0..n+1, 0..n+1},
		D = BigD[1..n, 1..n] dmapped Block(boundingBox={1..n,1..n}),
	LastRow = D.exterior(1,0);
var A, Temp, Temp2 : [BigD] real;
const DW = BigD.expand(-1,-1);
A[BigD] = 0.0;
A[D]=-0.1;
var delta=1.0;
var n2=n/2;
timer.start();
//var iters = 0;
// do{
//     forall(i,j) in D do
// 	{
// 	Temp[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
// 	//Temp2[i,j] = here.id;
// 	}
// 	iters+=1;
// //var delta = 1.0;
// //if(iters>minIters) then
// 	delta = A[n2,n2];
// //writeln(A);
// //write(iters);
// //write(" ");
// //writeln(delta);
// A[D] = Temp[D];
// } while (delta>-0.36);

for iters2 in {1..iters} do{
    forall(i,j) in D do
	{
	Temp[i,j] = (A[i-1,j] + A[i+1,j] +A[i,j-1]+ A[i,j+1] - h*h*p/T) / 4;
//	Temp2[i,j] = here.id;
	}

A[D] = Temp[D];
}
timer.stop();
writeln("Time: ",timer.elapsed(TimeUnits.milliseconds));
//writeln(Temp2);
//writeln(A);
//writeln(A[n/2,n/2]);
//writeln(iters);
