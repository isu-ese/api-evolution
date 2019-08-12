!def(figures)(
Creates a figure with subfigures in it.
Accepts three arguments. The first is the name. The second is the caption. The third is the content of the figure.
You can reference the figure like this: `[@fig:<name>]`.
)
~~~

:::::::::::::::::::::::::::::::::::::::::::::: {#fig:!1}

!3

!2

::::::::::::::::::::::::::::::::::::::::::::::

~~~

!def(widefig)(
    Figures created inside this environment are wide.
)(

```{=latex}
\begin{widefig}
```

!1

```{=latex}
\end{widefig}
```

)

!def(latex)(
    Executes the following as latex.
)(
```{=latex}
!1
```
)


!def(calc)(
    Calculates the expression using bc
) (!bash(echo '!1' | bc -l))

!def(bib)(
    Inserts the bibliography at the specified location
)(

\setlength{\parsep}{0pt}

!latex
```
\IEEEtriggeratref{!2}
\bibliographystyle{IEEEtran}
\bibliography{!1}
```
)

!def(grammar)(Creates a bnf grammar using the specified rules)
(
!latex
```
\begin{grammar}
!1
\end{grammar}
```
)

!def(rq)(
    Setup the enumeration process for research questions
)(
```{=latex}
\begin{enumerate}[label={\textbf{RQ\arabic*}},left=.2in]

!1

\end{enumerate}
```
)

!def(rg)(
    Setup the enumeration process for research questions
)(
```{=latex}
\begin{enumerate}[label={\textbf{RG}},left=.2in]

!1

\end{enumerate}
```
)

!def(hyp)(
    Setup the enumeration process for hypotheses
)(
```{=latex}
\begin{enumerate}[label={\textit{H\textsubscript{\arabic*,0}}},left=.2in]

!1

\end{enumerate}
```
)

!def(althyp)(
    Setup the enumeration process for hypotheses
)(
```{=latex}
\begin{enumerate}[label={\textit{H\textsubscript{\arabic*,A}}},left=.2in]

!1

\end{enumerate}
```
)

!def(metrics)(

)(
```{=latex}
\begin{enumerate}[label={\textbf{M\arabic*}},left=.2in]

!1

\end{enumerate}
```
)
