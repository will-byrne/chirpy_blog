---
layout: post
title: Creating a custom theme
---

## Ghost themes

Ghost comes with a default theme called Casper, which is designed to be a clean, readable publication layout and can be easily adapted for most purposes.

If you need something a little more customised, it's entirely possible to build on top of existing open source themes, or to build your own from scratch. Rather than giving you a few basic settings which act as a poor proxy for code, we just let you write code.

## Marketplace

There are a huge range of both free and premium pre-built themes which you can download from the [Ghost Theme Marketplace](https://ghost.org/marketplace/):

<figure class="kg-card kg-image-card kg-card-hascaption"><img src="https://static.ghost.org/v3.0.0/images/theme-marketplace.png" class="kg-image" alt="Ghost theme marketplace screenshot" loading="lazy"><figcaption>Anyone can write a completely custom Ghost theme with some solid knowledge of HTML and CSS</figcaption></figure>
## Theme development

Ghost themes are written with a templating language called handlebars, which has a set of dynamic helpers to insert your data into template files. For example: `{{author.name}}` outputs the name of the current author.

The best way to learn how to write your own Ghost theme is to have a look at [the source code for Casper](https://github.com/TryGhost/Casper), which is heavily commented and should give you a sense of how everything fits together.

- `default.hbs` is the main template file, all contexts will load inside this file unless specifically told to use a different template.
- `post.hbs` is the file used in the context of viewing a post.
- `index.hbs` is the file used in the context of viewing the home page.
- and so on

We've got [full and extensive theme documentation](https://ghost.org/docs/themes/) which outlines every template file, context and helper that you can use. You can also get started with our useful [starter theme](https://github.com/TryGhost/Starter/), which includes the most common foundations and components required to build your own theme.

> If you want to chat with other people making Ghost themes to get any advice or help, there's also a **themes** section on our [public Ghost forum](https://forum.ghost.org/c/themes).

