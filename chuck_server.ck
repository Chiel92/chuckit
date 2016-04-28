OscRecv orec;
5005 => orec.port;
orec.listen();
orec.event("/debug") @=> OscEvent e;

<<<"Waiting">>>;
e => now;
<<<"Received">>>;

