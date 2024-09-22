# MEALS-APP

## Navigation & Multi-Screen Apps
### Allowing Users To Navigate Between Screens
- Managing Screen Stacks
- Working with Tab Bars
- Using Side Drawers

Replacing WillPopScope with PopScope

In recent versions of Flutter, the WillPopScope widget we're using in the next lecture has been marked as deprecated.

Therefore, in the next lecture, instead of using WillPopScope you should use PopScope.

The code we write in the next lecture should look like this:
```dart
    PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(...) // same code as shown in the next lecture
    ),
```
NOT like this:
```dart
    WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.glutenFree: _glutenFreeFilterSet,
          Filter.lactoseFree: _lactoseFreeFilterSet,
          Filter.vegetarian: _vegetarianFilterSet,
          Filter.vegan: _veganFilterSet,
        });
        return false;
      },
      child: Column(...) // same code as before
    ),
```    