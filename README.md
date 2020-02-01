# WILDWISH APP  

# Description

This web app is a simple site where visitors are able to see a list of 'wishes' to be fulfilled on the landing page. Each 'wish' has a specific animal and a toy attributed to it. Each donation funds the wish. When the wish is fully funded, the toy will be sent to the animal and a new wish will be selected to then be displayed on the landing page.

Donors will be emailed when the animal receives the toy. The receiving zookeeper will be prompted to upload a picture of the animal with the new toy. This picture will be displayed in the thank you email to every donor who helped fund that wish.

# Install dependencies

With Ruby already installed, run 'bundle install' in the root directory. If you don't have Ruby, install it, then run 'gem install bundler' so you can run 'bundle install'.

# Seed the database

This is using Postgresql for the database. Make sure Postgres is installed on your machine and running before migrating or seeding.

In the root directory, run 'rails db:migrate' then 'rails db:seed'.

# Start the server

Run 'rails server' in the terminal to start the server. Resources can be accessed as an API using RESTful routes ('/animals', '/wishes/active', etc). The routes for this branch ('js-concept-backend') are:

GET '/wishes/active'
POST '/wishes/:id/reset_donations'
POST '/donations'
GET '/wishes/reset_active_wishes'

# Ignore the mess

This is the first Rails app I created. As such, you may find code that is redundant, repetitive, or doesn't follow convention. There is plenty of code that is not currently being used by the frontend concept that was built to accompany this, or commented out so features like authentication could be built later. The main branch will continue to be worked on to push to production, this branch may sit untouched for some time.

# Authors

Matt Plichta https://github.com/bigcatplichta

# License

Copyright 2019 Matt Plichta

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.