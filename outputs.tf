output "arn" {
    value = "${aws_batch_compute_environment.batch_environment_spot.0.arn}"
}
