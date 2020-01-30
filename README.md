# WILDWISH APP  

# Description

This web app is a simple site where visitors are able to see a list of 'wishes' to be fulfilled on the landing page. Each 'wish' has a specific animal and a toy attributed to it. Each donation funds the wish. When the wish is fully funded, the toy will be sent to the animal and a new wish will be selected to then be displayed on the landing page.

Donors will be emailed when the animal receives the toy. The receiving zookeeper will be prompted to upload a picture of the animal with the new toy. This picture will be displayed in the thank you email to every donor who helped fund that wish.

# Dependencies

First ensure that Ruby is installed, and that you have the current version of Bundler with 'gem install bundler'.

To install dependencies, run 'bundle install' in the 'backend' directory. 

# Seed the database

In the backend directory, run 'rails db:migrate' then 'rails db:seed'.

# Running

Run 'rails server' in the terminal to start the server, and navigate to the port listed. Resources can be accessed as an API using RESTful routes ('/animals', '/wishes/active', etc)

# Authors

Matt Plichta https://github.com/bigcatplichta

# License

Copyright 2019 Matt Plichta

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.