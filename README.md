# HCCC 3-Column Content Component

A flexible three-column card layout component using XML and XSLT transformation. This component provides a clean separation between content and presentation, making it easy to maintain and update card content.

## Features

- XML-based content management
- XSLT transformation for dynamic HTML generation
- Bootstrap 5 styling with square corners
- Conditional rendering of card elements
- Responsive layout (3 columns on desktop, stacks on mobile)

## File Structure

- `cards.xml` - Content data in XML format
- `transform.xslt` - XSLT transformation rules
- `composer.json` - PHP dependencies
- `README.md` - Documentation

## Content Structure

Each card in `cards.xml` can have:
- `image` - URL of the card image
- `title` - Card title (optional)
- `text` - Card description (optional)
- `footer` - Footer content

The card-body section only appears if either title or text has content.

## Usage

1. Add or modify cards in `index.xml`:
```xml
<card>
    <image>image_url</image>
    <title>card_title</title>
    <text>card_description</text>
    <footer>footer_content</footer>
</card>
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
- Conditional rendering of card-body based on content
- Bootstrap class application
- Square corner styling (rounded-0)
- Responsive layout structure
```