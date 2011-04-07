


# Cascading.vim

Cascading auto-break:

    $var->foo->bar->short()->very_long_long_long( )->very_long_long_long_long( )

Press `--` to convert line into

    $var->foo->bar
        ->short()
        ->very_long_long_long( )
        ->very_long_long_long_long( )


## Supported File Types

* php
* perl
* ruby
