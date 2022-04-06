# DB subnet 

resource "aws_db_subnet_group" "postgres-subnet-group" {
  name       = "postgres-subnet-group"
  subnet_ids = aws_subnet.private.*.id
}