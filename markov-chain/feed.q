/ q feed.q -p 5050
/ -----------------
/ Simulates 2-state Markov Chain
/ and broadcasts to subscribers

m: (.9  .1; 
		.15 .85)

state: 0;

nextState: {state:: 1 - neg 1 - sum (rand 1f) < sums m[state]; state}

.u.subs: `int$()

.z.po: {.u.subs: .u.subs union .z.w}

.z.pc: {.u.subs: .u.subs except x}

.z.ts: {
	{(neg x)(`upd; nextState[])} each .u.subs;
	}

\t 500