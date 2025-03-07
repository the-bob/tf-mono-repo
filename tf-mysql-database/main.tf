
resource "mysql_database" "database" {
  name                  = var.mysql_database
  default_character_set = var.mysql_default_character_set
  default_collation     = var.mysql_default_collation
}

resource "mysql_user" "database" {
  user               = var.mysql_database_user
  plaintext_password = local.password
  host               = "10.1.%.%"
}

resource "mysql_grant" "database" {
  user     = mysql_user.database.user
  database = mysql_database.database.name
  host     = mysql_user.database.host
  privileges = ["SELECT", "INSERT", "UPDATE", "DELETE", "CREATE",
    "DROP", "INDEX", "ALTER", "CREATE TEMPORARY TABLES", "CREATE VIEW", "EVENT", "TRIGGER",
  "SHOW VIEW", "CREATE ROUTINE", "ALTER ROUTINE", "EXECUTE"]
}