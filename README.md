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

Middleman is a view layer without any yml like data embedded. Since whole logic sits outside of Middleman a glue layer was provided in form of data access helpers.

Persistence is done by pluggable adapters to data repositories. Currently there are two adapters, YmlAdapter (used for normal application runs) and MemoryAdapter (for easier testing).

Business Logic is covered by set of Value Objects and Repositories to retrieve them.

### Reasons
The reason to introduce separate layers is to allow swapping each of them easily.

Two possible scenarios of grow are considered:
* Bind real database with modificable data from outside (admin panel), and rebuild page to static files using middleman
* Switch to runtime execution solution done by some framework
