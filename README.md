# Kota's vi mode prompt

Your prompt will be set to your current path, but substituting ~ for
/home/username. It will turn red if the last command had a non-zero exit status
and will turn blue when in vi normal mode.

The code is very simple so you can easily customize the colors or whatever.

To use set `PROMPT='$(vi_mode_status)'`
