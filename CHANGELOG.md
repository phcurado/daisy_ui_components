# Changelog

All notable changes to this project will be documented in this file.

## 0.9.1 - Unreleased

### Changed

- Accordion component now supports `content` slot
- Accordion storybook

## 0.9.0 - 2025-08-20

### Added

- Compatibility with phoenix 1.8
- Added optional keyword to import the core components into your project: `use DaisyUIComponents, core_components: true`

## 0.8.7 - 2025-06-15

### Added

- Add collapsible option on table component
- Add sortable columns on table component
- Add fieldset label on checkbox group and radio group components
- Add toggle on form and input components
- Add custom events on pagination click
- Add `href` rest attribute on tab component

### Changed

- Fix radio group value matching

## 0.8.6 - 2025-06-01

### Added

- Accordion component
- Collapse component
- Custom installer to add a copy of this library components into your project
- Checkbox Group component
- Checkbox Group storybook
- Radio Group component
- Radio Group storybook

### Changed

- Add `rows` and `cols` on attributes textarea component
- Add `soft`, `dash` and `direction` attributes on alert component

## 0.8.5 - 2025-05-23

### Changed

- Add button `soft` and `dash` variants
- Fix texarea line spaces being added on heex formatter

## 0.8.4 - 2025-05-22

### Changed

- Progress component with `value` and `max` attributes

## 0.8.3 - 2025-04-22

### Added

- Tabs component
- Tabs storybook

## 0.8.2 - 2025-04-04

### Changed

- Added `value` and `name` attributes in the `toggle` component

## 0.8.1 - 2025-03-26

### Changed

- Fix `textarea` render slot on form component
- Removed `value` attribute from `textarea` component
- Removed `assert_html` library

## 0.8.0 - 2025-03-22

### Added

- Support for the new DaisyUI V5
- Label component
- Label storybook
- Fieldset component
- Fieldset storybook
- Progress component
- Progress storybook
- Footer component
- Footer storybook

### Changed

- DaisyUI version to 5.x.x
- Fix Table ID header
- Fix CI cache
- List component
- List storybook
- Card `padding` attribute removed, now using card `size` attribute.
- Avatar online, offline and placeholder classes
- `form_input` now uses `fieldset` component to wrap the input, label and errors
- inputs now have borders as the default design. To remove the border, add the boolean attribute `ghost`
- A new size `xl` added

## [0.7.6] - 2025-02-17

### Added

- Hero component
- Hero storybook

## [0.7.5] - 2025-02-16

### Added

- Join storybook
- Indicator component
- Indicator storybook

## [0.7.4] - 2025-02-15

### Added

- Swap controller `slot`
- Tooltip storybook

## [0.7.3] - 2025-02-15

### Changed

- Fix swap component input checkbox

## [0.7.0] - 2025-02-13

### Added

- Card storybook
- Menu component
- Menu storybook
- Input storybook
- Textarea storybook
- Radio component
- Stat storybook
- Pagination storybook
- Checkbox storybook
- Radio storybook
- Select storybook

### Changed

- Card slots: `title`, `body` and `actions`
- Card modifier with `side` and `image_full` properties
- Stat with slots
- Pagination size attr

## [0.6] - 2025-02-09

### Added

- Drawer Storybook
- Navbar Storybook
- Badge Storybook
- Card `image-full` property

### Changed

- Drawer with better naming convention on slots
- Dropdown `align` property
- Navbar slots for start, center and end
- Documentation improvements
