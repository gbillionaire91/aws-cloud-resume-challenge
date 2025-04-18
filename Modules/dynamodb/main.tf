resource "aws_dynamodb_table" "view-counter" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Project = "Cloud Resume Website"
  }
}

resource "aws_dynamodb_table_item" "views" {
  table_name = aws_dynamodb_table.view-counter.name
  hash_key   = aws_dynamodb_table.view-counter.hash_key
  item = jsonencode({
    "id" : {
      "S" : "1"
    },
    "Views" : {
      "N" : "59"
    },
  })
}
