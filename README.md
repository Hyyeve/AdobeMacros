# AdobeMacros
My AutoHotkey scripts that I've slowly been building up for use with Adobe software

Originally inspired by Taran Van Hemert's auotmation scripts and systems (see https://github.com/TaranVH/2nd-keyboard), this is a
much smaller version of it which I'm slowly building up for my own use.

Among video editing and other things, I'm also a programmer, so my main goal here has to been to simplify, improve, and optimise
the functions that I myself use, as well as organising it a little better than taren's original repo.

All functions are in separate files which are #inlcuded into the core file, and have no inter-dependencies between each other.
(Except for relying on the shortcuts file, which defines what the key shortcuts for various premiere actions are)

So far, it's been very slow going, only having made two scripts, but that's largely because those are the only ones I actually
need for what I currently edit. More will appear as I decide to make them.

That said, I'm really happy with the optimisation and improvements I've managed to do for those - Particularly with ApplyPreset(),
I've dropped the code complexity massively and made it run almost instantly, with no sleep calls at all! (Though depending on your
machine, you may need to re-add sleep calls if things aren't processed fast enough)

Of note - Although all the code itself is almost completely dynamic and in most cases won't need any modification,
I rely on ImageSearch to locate things inside panels. The images I use are made with my appearence settings (including
custom highlight colour and font size), and you WILL need to replace them with your own (...unless somehow you have exactly 
the same appearence settings as me already). The exact size of the images isn't critical, but they need to be 
within a few pixels of mine to work properly. Also, the window titles used to get window controls may vary - use WindowSpy to check if needed.
