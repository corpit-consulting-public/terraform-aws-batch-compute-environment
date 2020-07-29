output "arn" {
    value = "${aws_batch_compute_environment.batch_environment_managed.0.arn}"
}
