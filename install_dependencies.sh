#!/bin/bash
set -e

echo "[*] Installing dependencies..."
echo ""
pip3 install sphinx --upgrade --user
git clone --depth 1 https://github.com/rtfd/sphinx_rtd_theme.git
cd sphinx_rtd_theme
python3 setup.py install
cd ..
rm -rf sphinx_rtd_theme

echo ""
echo "[*] Finished!"
echo "    - Run 'make html' to compile to html."
echo "    - Run 'make latexpdf' to compile a pdf."
echo "    - Run 'make' to see all of the possible building options."
echo "    - All results will be in ./build/"
