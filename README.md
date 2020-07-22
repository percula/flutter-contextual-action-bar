# Flutter contextual action bar(CAB)

A reliable contextual action bar workaround for flutter.
![](https://raw.githubusercontent.com/De-Morgan/flutter-contextual-action-bar/master/screenshots/snapshot.png)



# CAB & Flutter
CAB is a top app bar that replace the application app bar to provide contextual actions to selected items. Check the material implementation and requirement [here](https://material.io/components/app-bars-top#contextual-action-bar)

Flutter does not natively support CAB yet. see [issue](https://github.com/flutter/flutter/issues/44464)
Until CAB is natively supported, this package should provide you with an elegant way to implement the contextual action bar in flutter.


## How it works

- `ContextualActionScaffold`
- `ContextualAppBar`
- `ContextualAction`
- `ContextualActionWidget`

## `ContextualActionScaffold<?>`

The `ContextualActionScaffold<?>` is similar to the normal material `Scaffold` except that it also takes
a required `contextualAppBar`.

```
ContextualActionScaffold<?>(
      appBar: AppBar(),
      contextualAppBar: ContextualAppBar(),
      body: Body(),
    )
 ```

## `ContextualAppBar<?>`
The `ContextualAppBar<?>` is similar to the normal material `Appbar` but takes a `counterBuilder` instead of `title` and also a `contextualActions` instead of `actions`.

```
 ContextualAppBar(
      counterBuilder: (int itemsCount){
        return Text("$itemsCount Selected");
      },
      contextualActions: <ContextualAction>[],
    )
   ```

## `ContextualAction<?>`

The `ContextualAction<?>` allows you to take actions on the selected items, with the help of `itemsHandler` callback.

```
ContextualAction(
            itemsHandler: (List<?> items) {
              items.forEach((item) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("$item saved"),
                ));
              });
            },
            child: Icon(Icons.save),
          ),
 ```


## `ContextualActionWidget<?>`

You can use the `ContextualActionWidget` anywhere in the `ContextualActionScaffold` `body` to notify  `ContextualActionScaffold` that an item have been selected in order to show the `ContextualAppBar`. 

```
   ContextualActionWidget(
          data: ?,
          child: ChildWidget(),
        )
 ```
 
*Note: It is important that the child widget does not handle onLongPress.*
 
 ## A closer look at `ContextualActionWidget<?>`

 The `ContextualActionWidget<?>` takes other optional parameters like
 - `selectedColor`
 - `selectedWidget`
 - `unselectedWidget`
 
 The `selectedColor` is the color of the background for the selected item, it defaults to the splash color, if not provided. The `selectedColor` works well with `ListTile`.
 
 `selectedWidget` and `unselectedWidget` are `stacked` on top of the provided child widget. By default, they are positioned at the center of the provided child widget.
 Since They are stacked, you can use `Row`, `Align`, `Positioned` Widget or any other combination of widgets to position  them where desired. 
 
 The `selectedWidget` is shown when the `ActionMode` is enabled and the item is selected, while the `unselectedWidget` is shown when `ActionMode` is enabled and the item is not selected. See example(status_saver) image below with both the `selectedWidget` and `unselectedWidget` aligned to the top-right corner.

 ![](https://raw.githubusercontent.com/De-Morgan/flutter-contextual-action-bar/master/screenshots/status_saver.png)

## ActionMode

This contextual action bar workaround does not support zero item in the `ActionMode`.

- Use the `ActionMode.addItem<?>` to add an item to the selected items. If this is the first selection, the `ActionMode` is will be enabled. 

- Use the `ActionMode.addItems<?>` to add a list of items. 

- Use the `ActionMode.disableActionMode<?>` to disable and deselect all selected items.

 *Note: In most cases, you won't need to use `ActionMode.disableActionMode<?>` because the package already do that for you where needed.*

 
 ***Study complete examples at [example page](https://github.com/De-Morgan/flutter-contextual-action-bar/blob/master/example/lib/main.dart)***
 
 ### Other Packages authored by me
 
 - [loadinglistview](https://pub.dev/packages/loadinglistview#-readme-tab-)

## License
This package is licensed under the MIT license. See [LICENSE](https://github.com/De-Morgan/flutter-contextual-action-bar/blob/master/LICENSE) for details.


 