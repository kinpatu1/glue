data "template_file" "assume_role_json" {
  template = file("${path.module}/policies/assume_role.json.tpl")
}

resource "aws_iam_role" "glue_connection" {
  name               = var.iam_role
  assume_role_policy = data.template_file.assume_role_json.rendered
}

resource "aws_iam_role_policy" "glue_connection" {
  name = var.iam_policy
  role = aws_iam_role.glue_connection.id

  policy = "arn:aws:iam::aws:policy/service-role/AWSGlueDataBrewServiceRole"
}

resource "aws_iam_role_policy_attachment" "glue_connection" {
  role       = aws_iam_role.glue_connection.id
  policy_arn = aws_iam_role_policy.glue_connection.id
}
