numerous
========

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/numerous)](http://cran.r-project.org/package=numerous)

[Numerous](http://numerousapp.com) is a service for sharing and
following numbers such as stock prices, temperatures, the number of
processes running on a server, or the number of times you've visited the
gym this week. This package allows you to create, modify, and interact
with data on numerous quickly and easily from within R through the
[Numerous API](https://developer.numerousapp.com).

Installation
------------

This package is not quite ready to be available on
[CRAN](http://cran.r-project.org), but you can use
[devtools](http://cran.r-project.org/web/packages/devtools/index.html)
to install the current development version:

    devtools::install_github("briandconnelly/numerous")

First: Getting Your API key
---------------------------

Before you can interact with Numerous, you'll need to get your key.
Launch the mobile application
([iOS](https://itunes.apple.com/us/app/numerous-lifes-most-important/id797642904?mt=8),
[Android](https://play.google.com/store/apps/details?id=com.numerousapp)),
and go to *Settings* and *Developer Info*.

![]("https://raw.githubusercontent.com/briandconnelly/numerous/master/figures/screenshot_apikey.png")

In this screenshot, we see that our API key is **nmrs\_S7ZEna7Pmjg7**.
Keep this number handy, as you'll need it right away. Optionally, you
can save the key in your environment as `NUMEROUS_API_KEY` (or whatever
else you'd like).

Getting Started
---------------

Now that you've installed the numerous package, installed the mobile
app, and found your API key, it's time to get started.

Start up R and load the package:

    library(numerous)

Now, we're going to set the API key using the `set_numerous_key`
function. This must be done before interacting with Numerous.

### The Manual Option

The most straightforward way to set your key is to provide it as the
`key` argument to `set_numerous_key`:

    set_numerous_key(key = "nmrs_S7ZEna7Pmjg7")

Of course, you'll want to replace **nmrs\_S7ZEna7Pmjg7** with your own
key.

### Setting the Key from Your Environment

You can also use the value of an environment variable to set the key.
This is especially useful if you use Numerous in multiple ways (e.g.,
Python scripts, shell scripts, etc.). To specify where to find your key,
use the `env` argument. For example, if you stored your key in the
variable `MY_NUMEROUS_KEY`:

    set_numerous_key(env = "MY_NUMEROUS_KEY")

By default, this package uses `NUMEROUS_API_KEY`, so if you've saved
your key there, you can just run:

    set_numerous_key()

Now that your key is set, it's time to start working with Numerous.

Viewing a Metric
----------------

TODO

Creating a Metric
-----------------

TODO

Updating a Metric
-----------------

TODO

Modifying a Metric
------------------

TODO

Plotting a Metric's Values
--------------------------

We can easily plot a metric's value over time using R's base graphics.
Here, we'll get the "Phase of the Moon" metric and plot its values.

    moonphase <- get_metric(metric_id = "5676005772602922464")
    plot(moonphase)

![](figures/Basic%20plot-1.png)

Different labels and other properties can be specified using the
standard graphical parameters. Here, we'll change the labels and plot
lines instead of points:

    plot(moonphase, type = "l", xlab = "Month", ylab = "Value")

![](figures/Plot%20with%20updated%20labels-1.png)

### Using ggplot

TODO

Related Projects
----------------

-   [Python Implementation](https://github.com/outofmbufs/Nappy) by
    [Neil Webber](http://www.neilwebber.com/)
-   [Ruby Implementation](https://github.com/outofmbufs/numeruby) by
    [Neil Webber](http://www.neilwebber.com/)

Code of Conduct
---------------

This project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

Disclaimer
----------

This package and its developer are in no way affiliated with [Numerous,
Inc](http://numerousapp.com).
