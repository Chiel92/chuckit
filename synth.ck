<<<"Starting chuck server">>>;

OscRecv orec;
5005 => orec.port;
orec.listen();
orec.event("/debug") @=> OscEvent e;

<<<"Listening for OSC events">>>;

SinOsc s => dac;
int freq;
100 => freq;
freq => s.freq;

while (true)
{
freq => s.freq;
e => now;
<<<"Received">>>;
e.nextMsg();
100 + freq => freq;
}





//<<<"Waiting">>>;
//e => now;
//<<<"Received">>>;


//SinOsc p => PRCRev g => dac;
//SinOsc s => g;
//.5 => g.gain => g.mix;
//500 => s.freq => p.freq;
//2::second => now;

//SinOsc s => dac;
//SinOsc lfo => blackhole;
//// set the frequency of the lfo
//5 => lfo.freq;
//while (20::ms => now)
//{
//     ( lfo.last() * 10 ) + 440 => s.freq;
//}
