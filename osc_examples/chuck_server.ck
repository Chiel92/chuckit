OscRecv orec;
5005 => orec.port;
orec.listen();
orec.event("/debug") @=> OscEvent e;
orec.event("/frequency,f") @=> OscEvent f;

<<<"Waiting">>>;
e => now;
<<<"Received">>>;

<<<"Waiting">>>;
f => now;
<<<"Received">>>;
f.nextMsg();
<<<f.getFloat()>>>;
