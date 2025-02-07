
# Error Item
Example of inventory with Fail Item.
In this example, if the player is not creative a barrier with the name error will be displayed for 10 ticks
````yaml
name: "&8Test"
size: 54
items:
  example:
    item:
      material: DIAMOND
    slot: 22
    error_item:
      duration: 10 # Duration of item display
      item: # Item to display
        material: BARRIER
        name: "&cError"
    click_requirement:
      left_click:
        clicks:
          - ALL
        requirements:
          - type: placeholder
            placeholder: "%player_gamemode%"
            value: "CREATIVE"
            action: equals_string
````
# Paginate Button
Example of inventory with the Pagination button. In this example the items will be displayed on slot 21, 22 and 23 and on several pages.
<br>
The list of items contains the material and the name. You can put anything you want in the list. To use the value you must use the placeholder key. In this example the keys will be ``%material%`` and ``%name%``.
<br>
You can also apply changes to the value like this:
- ``%lower_<key>%`` - Displays the value in lower case.
- ``%upper_<key>%`` - Displays the value in upper case.
- ``%capitalize_<key>%`` - Display the value in capital
  You can use placeholders everywhere. For your requirements, commands, placeholders etc.
````yaml
name: "&8&lPagination &r&7%page%&8/&7%maxPage%"
size: 54
items:
  example:
    type: PAGINATION
    elements:
      - material: DIAMOND
        name: "diaMond"
      - material: IRON_INGOT
        name: "iron_INGOT"
      - material: EMERALD
        name: "emeRald"
      - material: COAL
        name: "cOAl"
      - material: GOLD_INGOT
        name: "gold_INGOT"
    slots:
      - 21-23
    item:
      material: "%material%"
      name: "&e%index% &7- &b%current%"
      lore:
        - "&8&m-----------------------"
        - ""
        - "&f%name% &8- &7Normal"
        - "&f%upper_name% &8- &fUpper case"
        - "&f%lower_name% &8- &7lower case"
        - "&f%capitalize_name% &8- &7Capitalized"
        - ""
        - "&8&m-----------------------"
  next:
    type: NEXT
    isPermanent: true
    slot: 50
    item:
      material: ARROW
      name: "&fNext"
  previous:
    type: PREVIOUS
    isPermanent: true
    slot: 48
    item:
      material: ARROW
      name: "&fPrevious"
````

# DYNAMIC PAGINATION 

Lets you create a dynamic inventory with placeholders. You can use this to create a ranking for example. The only limit is your imagination.

In the example if below you have placeholders generates by zMenu+ as an example.

`%zmenu+_pagination_size%` Returns the size of your list. This value will change when loading the plugin.

`%zmenu+_pagination_name_<index>%` Returns text based on the index. The text is generated automatically when loading the plugin.

You must then specify the start and end of the pagination. For this you have the `start` and `end`, which works with PlaceholderAPI.&#x20;

Then have 3 internal placeholders to help you get the button number that is displayed.

`%index%` - Returns the index of the button, starts at 0.

`%current%` - Returns the index of the button + 1, starts at 1.

`%value%` - Returns the value of the button. If your pagination does not start with 0 you must use se placeholder to retrieve the index of the button.

```yaml
name: "&8Dynamic Pagination &7%page%/%maxPage%"
size: 54
items:
  pagination:
    type: DYNAMIC_PAGINATION
    start: 10 # You need to specify the beginning, here 10. But the easiest way is to start at 0
    end: "%zmenu+_pagination_size%" # The number or pagination must stop
    slots:
      - 20-24
      - 29-33
    item:
      material: IRON_INGOT
      name: "&fHey its &e%zmenu+_pagination_name_%value%% &8- &f%index%"
      lore:
        - "&7Index&8: &f%index%"
        - "&7Current&8: &f%current%"
        - "&7Value&8: &f%value%"

  next:
    type: NEXT
    isPermanent: true
    slot: 50
    item:
      material: ARROW
      name: "&fNext"

  previous:
    type: PREVIOUS
    isPermanent: true
    slot: 48
    item:
      material: ARROW
      name: "&fPrevious"
```

# INPUT

Allows you to let the player write a message in the chat and perform actions in case of success or error.

Input type:

* `NUMBER` - Allows to check a number, you can set a minimum and maximum
* `TEXT` - Allows to check a text, you can set regex
* `ONLINE_PLAYER` - Allows to check the nickname of a player online

You can add conditions. For type NUMBER it is a minimum and maximum. For type TEXT it is a regex.

In this example the button allows to check if the chosen number is between 0 and 100

```yaml
name: "&8Input Inventory"
size: 27
items:
  chooseAmount:
    slot: 13
    type: INPUT
    item:
      material: DIAMOND_SWORD
      name: '&fChoose a number'
      lore:
        - ''
        - '&7Please choose a number between &b0&f and &a100'
    # Type of input to check
    # NUMBER - Allows to check a number, you can set a minimum and maximum
    # TEXT - Allows to check a text, you can set regex
    # ONLINE_PLAYER - Allows to check the nickname of a player online
    inputType: NUMBER
    # Conditions has checked, works with PlaceholderAPI
    conditions:
      min: 0
      max: 100
      # regex: "^[a-zA-Z0-9]+$"
    # Action performed in case of successful conditions
    success_actions:
      - type: console_command
        commands:
          - "bc %player% has just chosen the number %input% !" # or placeholder: %zmenu_input%
    # Action performed in case conditions failed
    error_actions:
      - type: message
        messages:
          - "&cYou must choose a number between 0 and 100."
    # Action performed when clicking, by default the inventory will not close, you must close it, then send a message or perform other action at the same time
    actions:
      - type: message
        messages:
          - "&7Please choose a number between &b0&f and &a100&8:"
      - type: close
```
