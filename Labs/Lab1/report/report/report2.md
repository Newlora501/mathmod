---
## Front matter
title: "Отчёт по лабораторной работе 2"
subtitle: "Простейший вариант 54"
author: "Еленга Невлора Люглеш"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Научиться работать с Julia и Openmodelica, решать задачу о погоне, строить графики траектории движения.

# Задание

Формула определения номера задания: (SnmodN)+1, где Sn — номер студбилета, N — количество заданий.

Вариант 54 

На море в тумане катер береговой охраны преследует лодку браконьеров. Через определенный промежуток времени туман рассеивается, и лодка обнаруживается на расстоянии 17,7 км от катера. Затем лодка снова скрывается в тумане и уходит прямолинейно в неизвестном направлении. Известно, что скорость катера в 3,8 раза больше скорости браконьерской лодки. 
1. Запишите уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени).  
2. Постройте траекторию движения катера и лодки для двух случаев. 
3. Найдите точку пересечения траектории катера и лодки .

# Теоретическое введение

1. Пусть  место нахождения лодки браконьеров в момент обнаружения: 

     t_0=0, x_{л0}=0

- Пусть место нахождения катера береговой охраны относительно лодки браконьеров в момент обнаружения лодки:

   x_{к0}=0.

2.  Введем полярные координаты. Считаем, что полюс - это точка обнаружения лодки браконьеров:

  x_{л0} (0=x_{л0}=0)

а полярная ось r проходит через точку нахождения катера береговой охраны.

3. Траектория катера должна быть такой, чтобы и катер, и лодка все время были на одном расстоянии от полюса , только в этом случае траектория катера пересечется с траекторией лодки.  Поэтому для начала катер береговой охраны должен двигаться некоторое время прямолинейно, пока не окажется на том же расстоянии от полюса, что и лодка браконьеров. После этого катер береговой охраны должен двигаться вокруг полюса удаляясь от него с той же скоростью, что и лодка браконьеров. 

4. Чтобы найти расстояние X (расстояние после которого катер начнет двигаться вокруг полюса), необходимо составить простое уравнение. Пусть через время t катер и лодка окажутся  на одном расстоянии x от полюса. За это время лодка пройдет x, а катер 
- k-x (или k+x, в зависимости от начального положения катера относительно полюса). Время, за которое они пройдут это расстояние, вычисляется как x/v или k-x/3.8v (во втором случае k+x/3.8v). Так как время одно и то же, то эти величины одинаковы. 

Тогда неизвестное расстояние x можно найти из следующего уравнения: x/v=(k-x)/3.8v в первом случае и x/v=(k+x)/3.8v во втором. Отсюда мы найдем два значения 

  x_1 = k/4.8; x_2 = k/2.8

  задачу будем решать для двух случаев.  

5. После того, как катер береговой охраны окажется на одном расстоянии от полюса, что и лодка, он должен сменить прямолинейную траекторию и начать двигаться вокруг полюса удаляясь от него со скоростью лодки v. Для этого скорость катера раскладываем на две составляющие: 

v_r - радиальная скорость и v_τ  - тангенциальная скорость.  

Радиальная скорость - это скорость, с которой катер удаляется от полюса,
 
     v_r = dr/dt 
   
Нам нужно, чтобы эта скорость была равна скорости лодки, поэтому полагаем 
      
      dr/dt = v 

Тангенциальная скорость – это линейная скорость вращения катера относительно полюса. Она равна произведению угловой скорости d dt   на радиус r, 
      v_τ  = r∂θ/∂t
    v_τ  = √(14,44v^2 - v^2) = √13,44v(учитывая, что радиальная скорость равна v). 
    
Тогда получаем 
     
      r∂θ∂t = √13,44v  

6. Решение исходной задачи сводится к решению системы из двух дифференциальных уравнений.Исключая из полученной системы производную по t, можно перейти к следующему уравнению: 

      ∂r/∂θ = r/√13,44 
    
При этом, начальные условия остаются прежними. Решив это уравнение, вы получите траекторию движения катера в полярных координатах. 


# Выполнение лабораторной работы

using Plots

plot(f, 0, 2*pi)

using Plots

"""начальные условия в случае 1"""

r0=17.7/2.8;

tetha0=0;

"""/начальные условия в случае 2

//r0=17,7/4,8

//tetha0=-%pi;"""

"""функция, которая описывает движение катера береговой охраны"""

function dr=f(tetha, r)

    dr=r/sqrt(13.44)

end

"""функция, описывающая движение лодки браконьеров"""

function xt=f2(t)

    xt=tan(fi)*t

end

fi=3*pi/4;

tetha=tetha0:0.01:2*pi;

r1=ode(r0,tetha0,tetha,f);

t=0:1:800;

"""/построение траектории движения катера и лодки """

plot(proj = :polar, r1.t,

linewidth = 2,


color =:red)


plot!(fill(sqrt(2)/2,4), collect(0:3), linewidth = 2,
color =:red)

построение траектории движения катера и лодки
@fig:001).

![Название рисунка](image/lab2modeli.png){#fig:001 width=70%}

![Название рисунка](image/lab2modeli2.png){#fig:001 width=70%}

# Выводы

В ходе выполнения лабораторной работы я освоила Julia и Openmodelica, научилась решать задачу о погоне и строить графики, записала уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени), построила траекторию движения катера и лодки для двух случаев, нашла точку пересечения траектории катера и лодки.

# Список литературы{.unnumbered}

::: {#refs}

https://docs.julialang.org/en/v1/

https://openmodelica.org/
:::