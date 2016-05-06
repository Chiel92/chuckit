//
// SERVER
//

fun int getSeconds()
{
    return (now / 1::second) $ int;
}

fun int getMilliSeconds()
{
    return (now / 1::second * 1000) $ int;
}

// handlers
fun void debug_listener(OscEvent event)
{
    while(true)
    {
        <<<"Waiting on debug">>>;
        event => now;
        <<<"Received debug">>>;
        event.nextMsg();
    }
}

fun void timing_listener(OscEvent event)
{
    while(true)
    {
        <<<"Waiting on timing">>>;
        event => now;
        <<<"Received timing">>>;
        event.nextMsg();
        <<<event.getInt()>>>;
        <<<"at">>>;
        <<<getMilliSeconds()>>>;
    }
}


OscRecv orec;
5005 => orec.port;
orec.listen();
orec.event("/debug") @=> OscEvent debug;
orec.event("/timing,i") @=> OscEvent timing;


// spork
spork ~ debug_listener(debug);
spork ~ timing_listener(timing);




//
// CLIENT
//
OscSend xmit;
xmit.setHost("localhost", 5005);
xmit.startMsg("/debug");

while(true)
{
.5::second => now;
<<<"Sending">>>;
xmit.startMsg("/timing", "i");
getMilliSeconds() => xmit.addInt;
}
