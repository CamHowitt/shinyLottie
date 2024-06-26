% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lottie_playback_controls.R
\name{lottie_playback_controls}
\alias{lottie_playback_controls}
\alias{lottie_play}
\alias{lottie_pause}
\alias{lottie_stop}
\title{Control Playback of 'Lottie' Animations}
\usage{
lottie_play(name = "all", session = shiny::getDefaultReactiveDomain())

lottie_pause(name = "all", session = shiny::getDefaultReactiveDomain())

lottie_stop(name = "all", session = shiny::getDefaultReactiveDomain())
}
\arguments{
\item{name}{A character string specifying the name of the 'Lottie' animation to control.
The default of "\code{all}" will control all animations within the 'shiny' application.}

\item{session}{The 'shiny' session object. Defaults to the current reactive domain.}
}
\value{
These functions are called for a side effect, and so there is no return value.
}
\description{
Control the playback of 'Lottie' animations within a 'shiny' application.
}
\details{
Each function sends a corresponding custom session message containing the function arguments:
\itemize{
  \item Play: "\code{lottie_js_play}"
  \item Pause: "\code{lottie_js_pause}"
  \item Stop: "\code{lottie_js_stop}"
}
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
library(shiny)
library(shinyLottie)

ui <- fluidPage(
  include_lottie(),
  lottie_animation(
    path = "shinyLottie/example.json",
    name = "my_animation"
  ),
  actionButton("play", "Play Animation"),
  actionButton("pause", "Pause Animation"),
  actionButton("stop", "Stop Animation")
)

server <- function(input, output, session) {
  observeEvent(input$play, {
    lottie_play(name = "my_animation")
  })

  observeEvent(input$pause, {
    lottie_pause(name = "my_animation")
  })

  observeEvent(input$stop, {
    lottie_stop(name = "my_animation")
  })
}

shinyApp(ui, server)
\dontshow{\}) # examplesIf}
}
