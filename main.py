__version__ = '1.0'
import random
import time

from kivy.app import App
from kivy.uix.button import Button

from pythonosc import osc_message_builder
from pythonosc import udp_client


class TestApp(App):
    def build(self):
        return Button(text='Hello World', on_press=do_osc)


def do_osc(arg):
    # client = udp_client.UDPClient('127.0.0.1', 5005)
    client = udp_client.UDPClient('localhost', 5005)
    msg = osc_message_builder.OscMessageBuilder(address="debug")
    # msg.add_arg(random.random())
    msg = msg.build()
    client.send(msg)

if __name__ == '__main__':
    TestApp().run()
