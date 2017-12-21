# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :aba_model, AbaModel.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("DB_NAME"),
  username: System.get_env("DB_USER"),  
  password: System.get_env("DB_PASSWORD"),
  hostname: System.get_env("DB_HOST")

config :aba_model, ecto_repos: [AbaModel.Repo]

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :aba_model, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:aba_model, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"

 #  Plsm configs are used to drive the extraction process. Below are what each field means:
 #    * module_name -> This is the name of the module that the models will be placed under
 #    * destination -> The output location for the generated models  
 #    * server -> this is the name of the server that you are connecting to. It can be a DNS name or an IP Address. This needs to be filled in as there are no defaults
 #    * port -> The port that the database server is listening on. This needs to be provided as there may not be a default for your server
 #    * database_name -> the name of the database that you are connecting to. This is required.
 #    * username -> The username that is used to connect. Make sure that there is sufficient privelages to be able to connect, query tables as well as query information schemas on the database. The schema information is used to find the index/keys on each table
 #    * password -> This is necessary as there is no default nor is there any handling of a blank password currently.
 #    * type -> This dictates which database vendor you are using. We currently support PostgreSQL and MySQL. If no value is entered then it will default to MySQL. Do note that this is an atom and not a string


config :plsm,
module_name: "AbaModel",
destination: "priv/repo/migrations/0000_init",
server: "db01.homenet",
port: "5432",
database_name: "aba_test",
username: "aba",
password: "aba",
type: :postgres