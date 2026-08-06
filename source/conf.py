# Configuration file for the Sphinx documentation builder.

# -- Project information -----------------------------------------------------

project = "AQ eReporting Guide"
copyright = "2026, EEA AQ Team"
author = "EEA AQ Team"
release = "0.1"

# -- General configuration ---------------------------------------------------

extensions = [
    "myst_parser",
    "sphinx_design",
]

templates_path = ["_templates"]
exclude_patterns = []

# -- HTML output -------------------------------------------------------------

html_theme = "sphinx_rtd_theme"

html_theme_options = {
    "collapse_navigation": False,
    "sticky_navigation": True,
    "navigation_depth": 4,
    "includehidden": True,
    "titles_only": True,
}

html_static_path = ["_static"]

html_css_files = [
    "custom.css",
]