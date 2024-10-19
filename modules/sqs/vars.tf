variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue in seconds"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "The length of time, in seconds, for which Amazon SQS retains a message"
  type        = number
  default     = 345600 # 4 days
}

variable "delay_seconds" {
  description = "The time, in seconds, that the delivery of all messages in the queue will be delayed"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it"
  type        = number
  default     = 262144 # 256 KB
}

variable "receive_wait_time_seconds" {
  description = "The time, in seconds, for which a ReceiveMessage call will wait for a message to arrive"
  type        = number
  default     = 0
}
