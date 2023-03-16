---
layout: post
title: Hosting my own Ghost on my Raspberry Pi
date: '2021-12-03 17:54:34'
categories:
- Blog
tags:
- infrastructure
- ghost
- lovecract
- rasberry-pi
---

![Unicorn Ghost](/assets/unicorn-ghost.jpg)

Having decided to start this project I encountered a few problems, surprises and more than a little frustration. Compared to when I last did this however it was a lot simpler.

## Setting up the Pi

This was surprisingly much harder to do than when I last used my raspberry Pi (4). When I flashed the image onto my Pi it would boot, show me the screen noting it had successfully expanded the storage on the sd card and would then just sit on a black screen even after rebooting. Fixing this was problematic as there was a large amount of conflicting information online as to what the problem was and how to fix it. Eventually I stumbled across someone else's blog who had encountered the exact same issue (apparently its been known for a while now).

Adding the following lines to the `/boot/config.txt` fixed the issue:

    hdmi_mode:0=63
    hdmi_drive:0=2
    hdmi_group:0=1
    hdmi_force_mode:0=1
    hdmi_ignore_edid:0=0xa5000080

This forces the Pi to start in HDMI mode among other things and allowed me to finish the setup and get everything else working with a nice desktop. Normally I would have just gone straight to a headless server but I wanted the Pi to be next to my TV so I could use it as a retro console and media centre (later projects).

## Installing Docker

The last time I tried to get `docker` working on a raspberry Pi I spent a whole weekend on it and the end result was me having to resist the urge to introduce the Pi to a hammer. This time however it was as simple as using the script provided by `docker` and installing `docker-compose` was handled easily by installing it with `pip3`.

Once `docker` was installed I quickly tested it by spinning up a few containers I had used in the past and found out that only a few of them support Arm `32bit` and the current Pi OS only has beta support for `64bit` and as this is something I want to be stable I opted for the `32bit` version. This means that while I have docker running on my Pi I will have to remember to check the compatibility of the containers before I try to add them.

## Spookifying up the Pi

Installing ghost was incredibly easy once I had docker running. I used the sample compose file from the [Ghost docker hub page](https://hub.docker.com/_/ghost) and all I had to change was a URL and a password. It should be robust and persist properly on reboot (will test later and see if this post disappears). It did take me an embarrassingly long time to find the URL for the admin panel before I remembered that it was just `/ghost` (every combination of `/admin, /settings, /preferences` was tried at some point).

## DNS (Dagon Nyarlotep Shoggoth)

DNS is the most frustrating thing to get working every time I attempt a project like this. It is a lovecraftian nightmare from which there is only madness and horror. That may seem &nbsp;a little harsh, some might say hyperbolic but my hatred for working this dark magic knows no bounds.

Because I have a dynamic IP address I am using a program called `ddclient` on my Pi which frequently checks its external IP address and send that information to a compatible nameserver and forward the ports on the router to allow http traffic to be sent to it (funny story about that later). I am using Google Domains to manage this particular domain and its DNS and nameservers so setting this up was not as bad as I was expecting and certainly much much easier than last time so it only took three cups of tea and some excessive swearing for roughly an hour to get it working.

On the Google Domains page there is a section hidden in the advanced DNS settings that allows you to enable dynamic DNS and provides a username and password. On the Pi I installed `ddclient` through `apt` and happily unlike last time the installer took me through a wizard where I entered the credentials and the domain name and that was pretty much it. My joy was slightly hampered with the realisation that I was setting up the wrong domain (I share a name with a Metal band but I own the `.com` domain so suck it!) and not wanting their traffic I opted to use one of my `.dev` domains instead. This meant that I had to wait for the entries for my old domain to clear from the Google nameservers before I could start using the new ones.

## NGINX and SSL

Again this was a relatively painless procedure in theory. I used `certbot`, a service provided by LetsEncrypt and the [Electronic Frontier Foundation](https://www.eff.org/) to handle my SSL certificates. They provide some really handy plugins so with `nginx` installed all I had to do was run one command and I was up and running with entries in my `sites-available` provided by the bot. I did have to add the proxies to my container and the redirect from `http` to `https` but those are simple to do.

It was at this point however that I messed up and made a big (and stupid) mistake! I could not connect via my desktop to my Ghost instance via my domain name. My first thoughts were that I had either messed up the DNS settings or that a Great Old One had possessed my Pi. Fearing to attempt to diagnose the latter I spent the next hour or so furiously checking all of my settings, configurations and sanity to see if I could find the issue. I tried:

- rebooting the Pi =\> nothing
- forcing a DNS update =\> nothing
- going direct via IP =\> nothing
- using `http` =\> nothing
- changing ethernet cables =\> nothing
- swearing =\> nothing
- sacrificed a goat to Cthulhu =\> messy office but no Ghost instance (apart from the angry goat ghost now haunting my desk)

It was at this point that I thought maybe I had missed a setting in my router....... I had. What I had done was forward port `80` to my Pi but nothing else!!! After berating myself for my stupidity I forwarded the `443` SSL port and boom, immediately I was able to access my site.

## Final Thoughts

Despite frustrations and self recriminations setting this up was fun, it's not often I get the chance or have the time to play with this sort of thing and I learned a bit about Docker along the way and a day you learn something new is a day well spent. Next time I set something like this up should be a lot simpler because I am going to image the sd card this is running on while its in a relatively base state and I have this document to prevent me making the same mistakes again. So in conclusion, check your port forwarding, beware angry goat ghosts, stay hydrated and FHTAGN!

![Cthulhu Fthagn](/assets/image-1.png)
