---
layout: post
title: The Ghost is dead
categories:
- Blog
tags:
- infrastructure
- jekyll
date: 2023-03-15 20:39 +0000
---
As it turns out trying to upgrade your `Ghost` server when suffering badly from insomnia is not a great idea.
Something went wrong with the upgrade and not only did it completely bork my database, but it also wiped all of my `Ghost` server configuration which I may have forgotten to back up.
I am pretty certain that I did something wrong, I wasn't exactly paying a lot of attention to what the upgrade docs were saying in regard to risks and breaking changes.
Oh, well the `Ghost` blog is dead(er?) so I figured it was time for a change (although that may have been the exhaustion talking, I should really get some sleep!).

Having lost my previous setup I decided to look into something that was a bit more lightweight and simpler to use.
Google was no help here, when searching for a new platform all I could find were adverts for `WordPress` which I refuse to use given prior experience.

## Enter Jekyll
![Gothic London](/assets/gothic_london.png)
> Generated with Estilovintedois
>
> prompt: estilovintedois, masterpiece, best quality, gothic, night, london, victorian, dr jekyll

`Jekyll` is a lightweight static page generator that is very customizable and can be as simple or complex as you want to make it.
Getting it up and running on my local machine was a snap (even for a `Ruby` gem) and within 30 or so sleep-deprived minutes I was happily breaking the config and making a nuisance of myself.
The basic premise is that you write your posts and pages in `markdown` and either create a theme using the sample template or download one someone else has made (I am using [Chirpy](https://chirpy.cotes.page/) as I am definitely no designer).
Once you are ready to publish the posts or pages you simply run the command:
```bash
bundle exec jekyll build
```
and a new version of the site will be created.

## Hosting
Hosting a `Jekyll` blog is relatively simple for your run-of-the-mill developer. All it took was tweaking my `nginx` config to point to a directory and not proxy to my docker containers.

...

...

That was it! OK yes if I hadn't already set up `letsencrypt` for my old `Ghost` blog I suppose that would have been needed as well but that is very easy nowadays.

## Writing Posts
Compared to `Ghost` the writing experience is a complete shift, with `Ghost` there is a slick UI with its own markdown editor with a nice side by side view. With `Jekyll` there are only `markdown` files, while this means you need to either 
edit the files in plaintext in something like `Vim` however you could also use `Ghostwriter` or in my case `Webstorm`.

## User base
Jekyll is actually the backend for `github` pages. This means there is a vibrant developer community who are mostly focussed on the github implementation but the files and gems that work there mostly work when self hosting. 
