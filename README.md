# R_LeafletInteractive_Laboratory-work-5
Лабораторная работа №6 – Создание и настройка карты в leaflet / Lab work #6 - Creating and customizing a map in leaflet
___

Пакет leaflet предполагает большое количество настроек, среди которых: добавление различных маркеров, создание легенды, использование интерактивного управления содержимым карты и т.д.

Для добавления возможности смены слоев карты, включения и отключения отдельных элементов, применяется настройка group, например `addTiles(group = "Базовая")`, добавляет возможность выбора конкретного слоя.

Для управления слоями (элементами слоя) применяется функция `addLayersControl()`. Которая позволяет, как переключать элементы, так и подключать разные элементы к слою. Для лучшего понимания, изучите данную функцию, а именно параметры: `baseGroups` и `overlayGroups`.
___
The leaflet package involves a large number of customizations, including: adding various markers, creating a legend, using interactive map content management, etc.

To add the ability to change map layers, enable and disable individual elements, the group setting is applied, for example `addTiles(group = "Basic")`, adds the ability to select a specific layer.

The `addLayersControl()` function is used to control layers (layer elements). Which allows you to both switch elements and connect different elements to a layer. For a better understanding, study this function, specifically the parameters: `baseGroups` and `overlayGroups`.
___
# Практическая часть / Practical part
Задание 1 – Используя ранее полученный набор данных, постройте карту, позволяющую переключать базовый слой на выбранный, также реализуйте добавления городов в зависимости от количества населения, разбив города на три группы (по численности населения). Также необходимо реализовать всплывающую подсказку, при клике на город, с текстом “Название города - Провинция (статус города). Численность населения за 20 лет изменилась на `---` человек”
___
Task 1 - Using the previously obtained dataset, build a map that allows you to switch the base layer to the selected one, also realize the addition of cities depending on the number of population, dividing the cities into three groups (by population). Also implement a tooltip, when clicking on a city, with the text "City name - Province (city status). The population for 20 years has changed by `---` people"
