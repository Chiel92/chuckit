# ChucKit

##Dependencies
- Python3.4 (not 3.5, because of kivy and mingw issues)
- Python-osc (version 1.6+)
- Kivy
- ChucK

##Installation

###Windows
Install python 3.4. Make sure to tick the "Add python to PATH option" in the installation
process.  Since I usually have multiple python installations, I go to the installation folder
(C:\Python34) by default, and rename `python.exe` to `python34.exe`. That way you can access
the right python installation by typing `python34` in a console.

To install python-osc run

```bash
pip3.4 install python-osc
```

Follow the steps on the [kivy website][kivy-install-windows] to install kivy.
In our case, these amount to

```bash
python34 -m pip install --upgrade pip wheel setuptools
python34 -m pip install docutils pygments pypiwin32 kivy.deps.sdl2 kivy.deps.glew --extra-index-url https://kivy.org/downloads/packages/simple/
python34 -m pip install kivy
```

Follow the steps on the [chuck website][chuck-install] to install chuck.


##Running

```bash
python34 main.py
```

[kivy-install-windows]: https://kivy.org/docs/installation/installation-windows.html
[chuck-install]: http://chuck.cs.princeton.edu/doc/learn/
