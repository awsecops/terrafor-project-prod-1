# CloudWatchAgentServerPolicy for AWS CloudWatch Container Insights
resource "aws_iam_role_policy_attachment" "eks_cloudwatch_container_insights" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.eks_nodegroup_role.name
}
