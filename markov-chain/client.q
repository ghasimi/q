/ q client.q
/ -----------------
/ Markov Chain Parameter Estimator

prevState: 0i;

n: ((0 0); (0 1); (1 0); (1 1))!(1 0 0 1);

m::(
	(n[(0 0)] % n[(0 0)] + n[(0 1)]; 	n[(0 1)] % n[(0 0)] + n[(0 1)]); 
	(n[(1 0)] % n[(1 0)] + n[(1 1)]; 	n[(1 1)] % n[(1 0)] + n[(1 1)])
	)

upd: {[newState]
	x: (prevState; newState);
	n[x]+::1;
	prevState:: newState;
	-1 .Q.s m;
	}

h: hopen 5050;
