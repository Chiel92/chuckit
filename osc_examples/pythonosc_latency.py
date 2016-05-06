
import time
import threading
from datetime import datetime
from pythonosc import osc_message_builder, udp_client, dispatcher, osc_server

#
# SERVER
#

def debug_handler(address):
    print('Received debug')

def timing_handler(address, seconds, microseconds):
    print('Received timing {}:{} at {}'.format(seconds, microseconds, datetime.now()))

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/debug", debug_handler)
dispatcher.map("/timing", timing_handler)

server = osc_server.ThreadingOSCUDPServer(
    ('localhost', 5005), dispatcher)
print("Serving on {}".format(server.server_address))
server_thread = threading.Thread(target=server.serve_forever)
server_thread.start()

#
# CLIENT
#

try:
    client = udp_client.UDPClient('localhost', 5005)

    msg = osc_message_builder.OscMessageBuilder(address="/debug")
    msg = msg.build()
    print('Sending')
    # print(msg.dgram)
    client.send(msg)

    for _ in range(3):
        msg = osc_message_builder.OscMessageBuilder(address="/timing")
        now = datetime.now()
        msg.add_arg(now.second)
        msg.add_arg(now.microsecond)
        msg = msg.build()
        print('Sending at', now)
        # print(msg.dgram)
        client.send(msg)
        time.sleep(.3)
finally:
    server.shutdown()



