# aleksandrakuls.com
Aleksandra Kuls Home Page.

### Design and Development:
cac.pl


### Installation & Development:
* bundle
* middleman -p 3000

### Tests:
* rspec

### Deployment (local):
* middleman build

### Deployment (heroku):
* normal git push


# Interesting aspects of the Project
The Project was refactored to keep separation between:
* business logic
* persistance mechanism
* view layer.

In the project, the Middleman part is a view layer without embedding any yml-like data. Since whole logic sits outside of Middleman, a glue layer was provided in a form of data access helpers.

Persistence is done by pluggable adapters that are used by data repositories. Currently there are three adapters, YmlAdapter (used for normal application runs), MongoDB adapter (to outsource some data to external db) and MemoryAdapter (for easier testing).

Business Logic is covered by set of Value Objects and Repositories to retrieve them.

### Reasons
The reason to introduce separate layers is to allow swapping each of them easily.

### The Project evolution
How the project evolves is a very interesting story. I started with a static middleman website. Due to rare yet regular content updates, part of the content is keeping in an external database. During the page build, so converting to static html files, data are dynamically pulled from a remote database. With a Repository layer already provided, all I needed was to write a remote database adapter.
