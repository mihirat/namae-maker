# namae-maker

list up all combination based on stroke number rules

## how to use

- list up all your characters not to use into ng_list.txt.

- run.

```shell
MODE=2 ruby main.rb
MODE=3 ruby main.rb > result.txt 

# After populating your favorite characters in good_list.txt
GOOD=1 MODE=3 ruby main.rb
```
