---
description: How to implement designs from Figma JSON & screenshots, applying lessons from past mistakes
---
# Figma to Flutter Implementation Rules

When implementing requirements based on Figma JSON attributes or screenshots, ALWAYS follow these rules formulated from previous implementation mistakes and learnings. 

## 1. Do NOT Hardcode `textDirection: TextDirection.rtl`
### The Mistake:
When working with Arabic designs (Right-to-Left), developers tend to add `textDirection: TextDirection.rtl` directly on a `Text` widget. However, Flutter does not define an `rtl` getter directly on the `TextDirection` enum in the main Dart core in the way it was sometimes mistakenly assumed, leading to compilation errors (`The getter 'rtl' isn't defined for the type 'TextDirection'`).
### The Solution:
- Allow the application's top-level `Directionality` widget and the `MaterialApp` locale to automatically inherit the correct text direction (RTL or LTR). Do not force it manually on individual text widgets.
- For padding and alignment, always use Directional counterparts instead of absolute Left/Right values (`AlignmentDirectional.centerStart`, `EdgeInsetsDirectional.only(start: 16)`).

## 2. Preventing RenderFlex Overflow (`Axis.horizontal` on right edge)
### The Mistake:
When placing multiple text widgets, symbols, or localized strings (e.g., Currency Symbol + Price + Space) inside a horizontal `Row`, it can overflow the right edge by X pixels on smaller device screens.
### The Solution:
- If a `Row` contains texts that might take up variable widths, wrap the entire `Row` or the specific expanding `Text` inside a constraint.
- **For prices/currencies**: Wrap the `Row` in a `FittedBox(fit: BoxFit.scaleDown)` so it correctly scales the text to fit the available horizontal constraint without overflowing.
- **For long strings**: Ensure `TextOverflow.ellipsis` is used and wrap the text in an `Expanded` widget.

## 3. Interpreting Figma Layouts (Rows & Columns) from Screenshots
### The Mistake:
Simply adding a `Container` with default `BoxDecoration` (such as a white background and drop shadow) because it "looks" like a card, failing to notice that the new design explicitly calls for a FLAT integration directly on the primary background color.
### The Solution:
- Look very closely at the background layers in the screenshot and the JSON. 
- Use the overarching `AppColors.primary` background where the item should be flat.
- Break down horizontal lists spanning elements into `Expanded(flex: X)` to strictly match proportions, instead of relying solely on intrinsic sizing or hardcoded widths. 
- Avoid relying on internal dividers if the design specifies an edge-to-edge separation line (use full-width thin lines outside the padding).

## 4. UI Consistency System Context
### The Mistake:
Using hardcoded styling (`TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)`).
### The Solution:
- Use the established extension methods provided in the codebase (e.g., `context.s14w700.copyWith(color: Colors.white)`).
- This keeps fonts and exact weight metrics consistent throughout the app.

## 5. Circular Images with Gradient Borders
### The Pattern:
When requested to build a profile avatar or salon image with a gradient border, use the following composition:
1. Outer `Container` -> `BoxShape.circle`, `BoxDecoration` with `LinearGradient` across the required colors, and precise width/height (e.g., 72).
2. `alignment: Alignment.center`
3. Inner `Container` -> `BoxShape.circle`, smaller width/height (e.g., 66) with a solid color matching the page's background (e.g., `AppColors.primary`).
4. `ClipRRect` inside the inner container wrapping the `CachedImage`.

## 6. Utilizing Translating Strings
### The Mistake:
Copying Arabic string values literally into UI texts.
### The Solution:
- Use localized string keys: `TranslationKeys.bookingCurrencySuffix.tr()`.
- Add new translations to the JSON translation files whenever a new static string appears in the Figma mockup.
