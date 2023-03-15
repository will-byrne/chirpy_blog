---
layout: post
title: Publishing options
---

## Distribute your content

Access the post settings menu by clicking the settings icon in the top right hand corner of the editor and discover everything you need to get your content ready for publishing. This is where you can edit things like tags, post URL, publish date and custom meta data.

## Feature images, URL & excerpts

Insert your post feature image from the very top of the post settings menu. Consider resizing or optimising your image first to ensure it's an appropriate size. Below this, you can set your post URL, publish date and add a custom excerpt.

## Tags & authors

You can easily add multiple tags and authors to any post to filter and organise the relationships between your content in Ghost.

## Structured data & SEO

There's no need to hard code your meta data. In fact, Ghost will generate default meta data automatically using the content in your post.

Alternatively, you can override this by adding a custom meta title and description, as well as unique information for social media sharing cards on Facebook and Twitter.

It's also possible to set custom canonicals, which is useful for guest posts or curated lists of external links.

Ghost will automatically implement **structured data** for your publication using JSON-LD to further optimise your content.

    {
        "@context": "https://schema.org",
        "@type": "Article",
        "publisher": {
            "@type": "Organization",
            "name": "Publishing options",
            "logo": "https://static.ghost.org/ghost-logo.svg"
        },
        "author": {
            "@type": "Person",
            "name": "Ghost",
            "url": "http://demo.ghost.io/author/ghost/",
            "sameAs": []
        },
        "headline": "Publishing options",
        "url": "http://demo.ghost.io/publishing-options",
        "datePublished": "2018-08-08T11:44:00.000Z",
        "dateModified": "2018-08-09T12:06:21.000Z",
        "keywords": "Getting Started",
        "description": "The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page."
    }
        

You can test that the structured data [schema](https://schema.org/) on your site is working as it should using [Google’s structured data tool](https://search.google.com/structured-data/testing-tool).

## Code injection

This tool allows you to inject code on a per post or page basis, or across your entire site. This means you can modify CSS, add unique tracking codes, or add other scripts to the head or foot of your publication without making edits to your theme files.

**To add code site-wide** , use the code injection tool in the main admin menu. This is useful for adding a Google Analytics tracking code, or to start tracking with any other analytics tool.

**To add code to a post or page** , use the code injection tool within the post settings menu. This is useful if you want to add art direction, scripts or styles that are only applicable to one post or page.

## Next: Admin settings

Now you understand how to create and optimise content, let's explore some [admin settings]( __GHOST_URL__ /admin-settings/) so you can invite your team and start collaborating.

