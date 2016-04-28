from pythonosc import dispatcher
from pythonosc import osc_server

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/debug", lambda _: print('Received'))

print('Waiting')
server = osc_server.ThreadingOSCUDPServer(
    ('localhost', 5005), dispatcher)
print("Serving on {}".format(server.server_address))
server.serve_forever()
