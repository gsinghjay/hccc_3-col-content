# HCCC Card Layout Component

A flexible card layout component using XML and XSLT transformation. This component provides a clean separation between content and presentation, making it easy to maintain and update card content.

## Features

- XML-based content management
- XSLT transformation for dynamic HTML generation
- Bootstrap 5 card group styling with square corners
- Conditional rendering of card elements
- Configurable number of cards per row
- Responsive layout (stacks on mobile)

## File Structure

- `index.xml` - Content data in XML format
- `transform.xslt` - XSLT transformation rules
- `composer.json` - PHP dependencies
- `README.md` - Documentation

## Content Structure

The root element can specify the number of cards per row:
```xml
<cards cards-per-row="3">
    <!-- card elements -->
</cards>
```

Each card in `index.xml` can have:
- `image` - URL of the card image
- `title` - Card title (optional)
- `text` - Card description (optional)
- `footer` - Footer content

The card-body section only appears if either title or text has content.

## Configuration

### Cards Per Row
Set the number of cards per row using the `cards-per-row` attribute in the root element:
```xml
<cards cards-per-row="4">  <!-- Shows 4 cards per row -->
```
Default is 3 if not specified.

## Usage

1. Add or modify cards in `index.xml`:
```xml
<cards cards-per-row="3">
    <card>
        <image>image_url</image>
        <title>card_title</title>
        <text>card_description</text>
        <footer>footer_content</footer>
    </card>
</cards>
```

2. Access through a web server:
```bash
php -S localhost:8000
```

3. View the transformed content at:
```
http://localhost:8000/index.xml
```

## Dependencies

- PHP 7.4 or higher
- ext-dom
- ext-libxml
- ext-xsl
- Bootstrap 5.3.0-alpha3

## Installation

1. Clone the repository
2. Install dependencies:
```bash
composer install
```

## Development

The XSLT transformation (`transform.xslt`) handles:
- Dynamic card grouping based on cards-per-row setting
- Conditional rendering of card-body based on content
- Bootstrap card-group implementation
- Square corner styling (rounded-0)
- Responsive layout structure

### Card Body Rendering
- Card body only appears if title or text has content
- Title and text elements are individually conditional
- Empty elements are completely removed from output