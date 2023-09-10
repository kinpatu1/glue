output "role_name" {
  value = aws_iam_role.glue_connection.name
}

data "template_file" "assume_role_json" {
  template = file("${path.module}/policies/assume_role.json.tpl")
}

resource "aws_iam_role" "glue_connection" {
  name               = var.iam_role
  assume_role_policy = data.template_file.assume_role_json.rendered
}

resource "aws_iam_role_policy_attachment" "glue_connection" {
  role       = aws_iam_role.glue_connection.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
